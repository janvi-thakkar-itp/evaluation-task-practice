variable "sg_name"{
    type=string
    description = "sg name"
    default="web101-Janvi-Thakkar-sg"
}

variable "vpc_id"{
    type=string
    description="cidr of the VPC"
    default= "10.0.0.0/16"
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

variable "ingress_cidr_blocks"{
    type=list(string)
    default=["0.0.0.0/0"]
    description = "sg ingress cidrs"
}

variable "ingress_rules"{
    type=list(string)
    default=["http-80-tcp", "all-icmp"]
    description = "sg ingress rules"
}

variable "egress_rules"{
    type=list(string)
    default=["all-all"]
    description = "sg egress rules"
}




