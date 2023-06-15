module "cdn" {

  source = "terraform-aws-modules/cloudfront/aws"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false

  origin = {
    alb = {
      domain_name = var.domain_name
    #   module.alb.lb_dns_name
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }

      origin_access_identity = "alb_origin"
    }

    # s3 = {
    #   domain_name = module.s3_bucket_for_logs.s3_bucket_bucket_domain_name
    #   custom_origin_config = {
    #     http_port              = 80
    #     https_port             = 443
    #     origin_protocol_policy = "http-only"
    #     origin_ssl_protocols   = ["TLSv1.2"]
    #   }

    #   origin_access_identity = "s3_origin"
    # }

  }

  default_cache_behavior = {
    target_origin_id       = "alb"
    viewer_protocol_policy = "allow-all"
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

}