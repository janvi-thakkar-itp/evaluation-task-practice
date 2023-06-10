module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  name        = var.sg_name
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_with_cidr_blocks = var.egress_with_cidr_blocks

  computed_ingress_with_source_security_group_id = var.computed_ingress_with_source_security_group_id
  number_of_computed_ingress_with_source_security_group_id = var.number_of_computed_ingress_with_source_security_group_id

  tags = merge(local.tags,{name=var.sg_name})
}


output "security_group_id" {
  value=module.security_group.security_group_id
}