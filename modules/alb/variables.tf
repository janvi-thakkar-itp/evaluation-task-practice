variable "alb_name"{
    type=string
    description = "name of the alb"
    default="alb"
}

variable "vpc_id"{
    type=string
    description = "vpc id"
    default=""
}

variable "subnets"{
    type=list(string)
    description = "subnets"
    default=[""]
}

variable "targets" {
    type=map(any)
    description="targets"
    default={

    }
}

variable "security_groups"{
    type=list(string)
    default=[]
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
