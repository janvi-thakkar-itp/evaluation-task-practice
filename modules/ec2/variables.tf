variable "vpc_cidr"{
    type=string
    description="cidr of the VPC"
    default= "10.0.0.0/16"
}

variable "instance_type"{
    type=string
    default="t2.micro"
}

variable instances{
    type=list(object({
        name=string,
        subnet_id=string
    }))
    description="list of instances to be created"
    default=  [
        {
        name  = "server1",
        subnet_id="10.0.4.0/27"
        },
    {
        name  = "server2",
        subnet_id="10.0.5.0/27"
    },
    {
        name  = "server3",
        subnet_id="10.0.6.0/27"
    }]
}

variable "private_subnets"{
    type= list(string)
    description="list of private subnet cidrs"
    default= ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets"{
    type= list(string)
    description="list of public subnet cidrs"
    default= ["10.0.4.0/27", "10.0.5.0/27", "10.0.6.0/27"]
}


variable "tags"{
    type= object({
        owner=string,
        lab=string
    })
    description ="tags"
    default={
        owner="janvi.thakkar@intuitive.cloud"
        lab="web101-Janvi-Thakkar"
    }
}


variable "owner"{
    type=string
    description="email id of the owner"
    default= "janvi.thakkar@intuitive.cloud"
}

variable "lab"{
    type=string
    description="name of the Lab"
    default= "web101-Janvi-Thakkar"
}

variable "vpc_security_group_ids"{
    type=list(string)
    description = "vpc security group ids"
    default=[""]
}

variable "azs"{
    type=list(string)
    description = "list of azs"
    default=[""]
}



variable "sg_ingress_cidr_blocks"{
    type=list(string)
    default=["0.0.0.0/0"]
    description = "sg ingress cidrs"
}

variable "sg_ingress_rules"{
    type=list(string)
    default=["http-80-tcp", "all-icmp"]
    description = "sg ingress rules"
}

variable "sg_egress_rules"{
    type=list(string)
    default=["all-all"]
    description = "sg egress rules"
}

variable "sg_name"{
    type=string
    description = "sg name"
    default="web101-Janvi-Thakkar-sg"
}

variable "subnet_id"{
    type=string
    description = "subnet id"
    default="sg-123"
}

variable "instance_name"{
    type=string
    description="name of the instance"
    default="instance"
}




