module "vpc"{
    source="./modules/vpc"
    tags=local.tags
}

module "ec2"{
    source="./modules/ec2"
    count = length(local.instances)
    depends_on = [ module.ec2_sg ]
    instance_name=  "server-${count.index}"
    instance_type= var.instance_type
    vpc_security_group_ids= [module.ec2_sg[count.index].security_group_id]
    subnet_id= module.vpc.public_subnets[count.index]
    azs=[var.az_names[count.index]]
    tags=local.tags
}

module "ec2_sg"{
    source="./modules/sg"
    count=length(local.instances)

    vpc_id= module.vpc.vpc_id
    computed_ingress_with_source_security_group_id=[
        {
        from_port                = 80
        to_port                  = 80
        protocol                 = "tcp"
        source_security_group_id = module.alb_sg.security_group_id
        }
    ]
    number_of_computed_ingress_with_source_security_group_id=1
    egress_with_cidr_blocks=var.egress_with_cidr_blocks
    ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
    tags=local.tags
}

module "alb_sg"{
    source="./modules/sg"
    vpc_id= module.vpc.vpc_id
    ingress_with_cidr_blocks=var.ingress_with_cidr_blocks
    egress_with_cidr_blocks=var.egress_with_cidr_blocks
    tags=local.tags
}

module "alb"{
    source="./modules/alb"
    alb_name="alb"
    vpc_id=module.vpc.vpc_id
    subnets = module.vpc.public_subnets
    security_groups = [module.alb_sg.security_group_id]
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
