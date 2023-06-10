## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/alb | n/a |
| <a name="module_alb_sg"></a> [alb\_sg](#module\_alb\_sg) | ./modules/sg | n/a |
| <a name="module_asg"></a> [asg](#module\_asg) | ./modules/asg | n/a |
| <a name="module_ec2_sg"></a> [ec2\_sg](#module\_ec2\_sg) | ./modules/sg | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Owner"></a> [Owner](#input\_Owner) | email id of the Owner | `string` | `"janvi.thakkar@intuitive.cloud"` | no |
| <a name="input_az_names"></a> [az\_names](#input\_az\_names) | list of availabilty zone names | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_egress_with_cidr_blocks"></a> [egress\_with\_cidr\_blocks](#input\_egress\_with\_cidr\_blocks) | egress with cidr blocks | `list(any)` | <pre>[<br>  {<br>    "cidr_blocks": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_ingress_with_cidr_blocks"></a> [ingress\_with\_cidr\_blocks](#input\_ingress\_with\_cidr\_blocks) | ingress with cidr blocks | `list(any)` | <pre>[<br>  {<br>    "cidr_blocks": "0.0.0.0/0",<br>    "from_port": 80,<br>    "protocol": "tcp",<br>    "to_port": 80<br>  },<br>  {<br>    "cidr_blocks": "0.0.0.0/0",<br>    "from_port": 443,<br>    "protocol": "tcp",<br>    "to_port": 443<br>  }<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | instance type | `string` | `"t2.micro"` | no |
| <a name="input_instances"></a> [instances](#input\_instances) | list of instances to be created | <pre>list(object({<br>    name      = string,<br>    subnet_id = string<br>  }))</pre> | <pre>[<br>  {<br>    "name": "server1",<br>    "subnet_id": "10.5.0.0/24"<br>  },<br>  {<br>    "name": "server2",<br>    "subnet_id": "10.6.0.0/24"<br>  },<br>  {<br>    "name": "server3",<br>    "subnet_id": "10.7.0.0/24"<br>  }<br>]</pre> | no |
| <a name="input_lab"></a> [lab](#input\_lab) | name of the Lab | `string` | `"web101-Janvi-Thakkar"` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | list of public subnet cidrs | `list(string)` | <pre>[<br>  "10.5.0.0/24",<br>  "10.6.0.0/24",<br>  "10.7.0.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | default region name | `string` | `"us-east-1"` | no |
| <a name="input_sg_egress_rules"></a> [sg\_egress\_rules](#input\_sg\_egress\_rules) | sg egress rules | `list(string)` | <pre>[<br>  "all-all"<br>]</pre> | no |
| <a name="input_sg_ingress_cidr_blocks"></a> [sg\_ingress\_cidr\_blocks](#input\_sg\_ingress\_cidr\_blocks) | sg ingress cidrs | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_sg_ingress_rules"></a> [sg\_ingress\_rules](#input\_sg\_ingress\_rules) | sg ingress rules | `list(string)` | <pre>[<br>  "http-80-tcp",<br>  "all-icmp"<br>]</pre> | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | sg name | `string` | `"web101-Janvi-Thakkar-sg"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | cidr of the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_security_group_id"></a> [vpc\_security\_group\_id](#input\_vpc\_security\_group\_id) | n/a | `string` | `"sg-12345678"` | no |

## Outputs

No outputs.