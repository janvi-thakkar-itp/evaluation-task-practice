module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = var.instance_name
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data  = base64encode(templatefile("userdata.tftpl",{var="vars"}))
  
  associate_public_ip_address = true
  tags = merge(local.tags,{Name=var.instance_name})
}

resource "aws_volume_attachment" "aws_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = module.ec2_instance.id
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = element(var.azs, 0)
  size              = 2
  tags =  merge(local.tags,{name="ebs_volume"})
}

output "instance_id" {
  value = module.ec2_instance.id
}

