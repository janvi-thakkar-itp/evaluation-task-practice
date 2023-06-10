variable "vpc_name"{
    type=string
    description="name of the VPC"
    default= "web101-Janvi-Thakkar-vpc"
}

variable "sg_name"{
    type=string
    description = "sg name"
    default="web101-Janvi-Thakkar-sg"
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

variable "is_nat_enabled"{
    type= bool
    description="whether to enable nat gateway or not"
    default= false
}

variable "single_nat_gateway"{
    type= bool
    description="whether to create single nat gateway or not"
    default= true
}

variable "is_vpn_enabled"{
    type= bool
    description="whether to enable vpn gateway or not"
    default= false
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





