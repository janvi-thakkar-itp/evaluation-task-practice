variable "region"{
    type=string
    description="default region name"
    default= "us-east-1"
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

variable instances{
    type=list(object({
        name=string,
        subnet_id=string
    }))
    description="list of instances to be created"
    default=  [
        {
        name  = "server1",
        subnet_id="10.5.0.0/24"
    },
    {
        name  = "server2",
        subnet_id="10.6.0.0/24"
    },
    {
        name  = "server3",
        subnet_id="10.7.0.0/24"
    }]
}

variable "public_subnets"{
    type= list(string)
    description="list of public subnet cidrs"
    default= ["10.5.0.0/24", "10.6.0.0/24", "10.7.0.0/24"]
}

variable "vpc_security_group_id"{
    type= string
    default="sg-12345678"
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

variable "instance_type"{
    type=string
    description="instance type"
    default="t2.micro"
}

variable "vpc_cidr"{
    type=string
    description="cidr of the VPC"
    default= "10.0.0.0/16"
}

variable "az_names"{
    type= list(string)
    description="list of availabilty zone names"
    default= ["us-east-1a", "us-east-1b", "us-east-1c"]
}


