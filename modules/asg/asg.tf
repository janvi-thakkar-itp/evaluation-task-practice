#Auto-Scaling Group
module "asg" {
  source     = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling Group
  name                = "${var.asg_tags.lab}-asg"
  min_size            = var.asg_ec2_min
  max_size            = var.asg_ec2_max
  desired_capacity    = var.asg_ec2_desired
  health_check_type   = "EC2"
  vpc_zone_identifier = var.asg_public_subnets_id
  scaling_policies = var.asg_scaling_policies

  #Lauch Template
  instance_type = var.asg_instance_type
  launch_template_name  = "${var.asg_tags.lab}-ec2-lauch"
  image_id          =  var.asg_ami
  security_groups             = [var.asg_security_group_id]

  # IAM Role & Instance Profile
  create_iam_instance_profile = true
  iam_role_name               = "${var.asg_tags.lab}-ec2-ssm"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM role ec2 SSM"
  iam_role_tags = {
    CustomIamRole = "Yes"
  }
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = var.asg_SSMManagedInstanceCore
  }

  #EC2 Tags
  tag_specifications = [
    {
      resource_type = "instance"
      tags = merge(var.asg_tags,{Name  = "${var.asg_tags.lab}-ec2"})
    }
  ]

  capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }

  target_group_arns = var.asg_target_group_arns

  tags = merge(var.asg_tags,{Name="${var.asg_tags.lab}-asg"})
}

output "asg_id" {
  value=module.asg.launch_template_id
}


