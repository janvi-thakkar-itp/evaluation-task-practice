module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  name        = var.sg_name
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules

  tags = merge(local.tags,{name=var.sg_name})
}

output "security_group_id" {
  value=module.security_group.security_group_id
}