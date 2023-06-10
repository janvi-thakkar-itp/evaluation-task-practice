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

variable "Owner"{
    type=string
    description="email id of the Owner"
    default= "janvi.thakkar@intuitive.cloud"
}

variable "lab"{
    type=string
    description="name of the Lab"
    default= "web101-Janvi-Thakkar"
}

variable "tags"{
    type= object({
        Owner=string,
        lab=string
    })
    description ="tags"
    default={
        Owner="janvi.thakkar@intuitive.cloud"
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

variable "ingress_with_cidr_blocks"{
    type=list
    description="ingress with cidr blocks"
    default= [{}]

}

variable "egress_with_cidr_blocks" {
    type=list
    description="egress with cidr blocks"
    default=[{ }]
}

variable "number_of_computed_ingress_with_source_security_group_id"{
    type=number
    default=0
}

variable "computed_ingress_with_source_security_group_id" {
    type=list
    default=[]
}



