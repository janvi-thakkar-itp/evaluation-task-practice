module "vpc"{
    source="./modules/vpc"
    tags=local.tags
}

module "ec2"{
    source="./modules/ec2"
    count = length(local.instances)
    depends_on = [ module.sg ]
    instance_name=  "server-${count.index}"
    instance_type= var.instance_type
    vpc_security_group_ids= [module.sg[count.index].security_group_id]
    subnet_id= module.vpc.public_subnets[count.index]
    azs=[var.az_names[count.index]]
    tags=local.tags
}

module "sg"{
    source="./modules/sg"
    count=length(local.instances)

    vpc_id= module.vpc.vpc_id
    ingress_cidr_blocks = var.sg_ingress_cidr_blocks
    ingress_rules       = var.sg_ingress_rules
    egress_rules        = var.sg_egress_rules
    tags=local.tags
}

module "alb"{
    source="./modules/alb"
    alb_name="alb"
    vpc_id=module.vpc.vpc_id
    subnets = module.vpc.public_subnets
    security_groups = module.sg[*].security_group_id
    targets={
        target1={
            target_id=module.ec2[0].instance_id
            port=80
        }
        target2={
            target_id=module.ec2[1].instance_id
            port=80
        }
        target3={
            target_id=module.ec2[2].instance_id
            port=80
        }
}
}
