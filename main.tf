module "vpc"{
    source="./modules/vpc"
    tags=local.tags
}


# requirement 2
# module "ec2"{
#     source="./modules/ec2"
#     count = 1
#     depends_on = [ module.ec2_sg ]
#     instance_name=  "server-${count.index}"
#     instance_type= var.instance_type
#     vpc_security_group_ids= [module.ec2_sg[count.index].security_group_id]
#     subnet_id= module.vpc.public_subnets[count.index]
#     azs=[var.az_names[count.index]]
#     tags=local.tags
# }

# resource "aws_ami_from_instance" "ami" {
#     depends_on =[module.ec2]
#     name               = "janvi-thakkar-ami"
#     source_instance_id = module.ec2[0].instance_id
# }

module "ec2_sg"{
    source="./modules/sg"
    count=1

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
            target_id=module.asg.asg_id
            port=80
        }
}
}

#Auto-Scaling Group
module "asg"{
  source     = "./modules/asg"

  # Autoscaling Group
  asg_ec2_min         = 1
  asg_ec2_max         = 3
  asg_ec2_desired     = 2
  asg_public_subnets_id = module.vpc.public_subnets
  
  asg_target_group_arns = module.alb.target_group_arns
  asg_scaling_policies = {
    my-policy = {
      policy_type               = "TargetTrackingScaling"
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 80.0
      }
    }
  }
  #Lauch Template
  asg_instance_type=var.instance_type
  asg_ami          =  "ami-0f3cb259a8ab23fd6"
  asg_security_group_id  = module.ec2_sg[0].security_group_id
  asg_tags=local.tags
}

########## requirement 1 ###########
# module "ec2"{
#     source="./modules/ec2"
#     count = length(local.instances)
#     depends_on = [ module.ec2_sg ]
#     instance_name=  "server-${count.index}"
#     instance_type= var.instance_type
#     vpc_security_group_ids= [module.ec2_sg[count.index].security_group_id]
#     subnet_id= module.vpc.public_subnets[count.index]
#     azs=[var.az_names[count.index]]
#     tags=local.tags
# }

# module "ec2_sg"{
#     source="./modules/sg"
#     count=length(local.instances)

#     vpc_id= module.vpc.vpc_id
#     computed_ingress_with_source_security_group_id=[
#         {
#         from_port                = 80
#         to_port                  = 80
#         protocol                 = "tcp"
#         source_security_group_id = module.alb_sg.security_group_id
#         }
#     ]
#     number_of_computed_ingress_with_source_security_group_id=1
#     egress_with_cidr_blocks=var.egress_with_cidr_blocks
#     ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
#     tags=local.tags
# }

# module "alb_sg"{
#     source="./modules/sg"
#     vpc_id= module.vpc.vpc_id
#     ingress_with_cidr_blocks=var.ingress_with_cidr_blocks
#     egress_with_cidr_blocks=var.egress_with_cidr_blocks
#     tags=local.tags
# }

# module "alb"{
#     source="./modules/alb"
#     alb_name="alb"
#     vpc_id=module.vpc.vpc_id
#     subnets = module.vpc.public_subnets
#     security_groups = [module.alb_sg.security_group_id]
#     targets={
#         target1={
#             target_id=module.ec2[0].instance_id
#             port=80
#         }
#         target2={
#             target_id=module.ec2[1].instance_id
#             port=80
#         }
#         target3={
#             target_id=module.ec2[2].instance_id
#             port=80
#         }
# }
# }
