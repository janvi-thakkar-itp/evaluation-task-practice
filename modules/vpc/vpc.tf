###########################################################
##   Module to Create VPC  ##
###########################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.az_names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  enable_nat_gateway = var.is_nat_enabled
# Single Nat Gateway
  single_nat_gateway = var.single_nat_gateway


  enable_vpn_gateway = var.is_vpn_enabled

  tags = merge(var.tags,{name=var.vpc_name})
#  tags = local.tags
}

output "vpc_cidr"{
    value=module.vpc.default_vpc_cidr_block
}

output "public_subnets"{
    value=module.vpc.public_subnets
}

output "private_subnets"{
    value=module.vpc.private_subnets
}

output "vpc_security_group_id"{
    value=module.vpc.default_security_group_id
}

output "vpc_id"{
    value=module.vpc.vpc_id
}
