module "alb" {
  source  = "terraform-aws-modules/alb/aws"

  name = var.alb_name

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.subnets
  security_groups    = var.security_groups
  
  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
    }
  ]


  tags = merge(local.tags,{name=var.alb_name})
}

output "target_group_arns" {
  value=module.alb.target_group_arns
  
}