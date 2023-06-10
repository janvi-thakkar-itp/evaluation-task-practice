variable "asg_ec2_min"{
    type=number
    default=1
}

variable "asg_ec2_max"{
    type=number
    default=1
}

variable "asg_ec2_desired"{
    type=number
    default=1
}

variable "asg_public_subnets_id"{
    type=list
    default=[]
}

variable "asg_ami"{
    type=string
    default=""
}

variable "asg_instance_type"{
    type=string
    default="t2.micro"
}

variable "asg_security_group_id"{
    type=string
    default=""
}

variable "asg_target_group_arns"{
    type=list(string)
    default=[""]
}

variable "asg_tags"{
    default={}
}

variable "asg_SSMManagedInstanceCore"{
    type=string
    default="arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

variable "asg_scaling_policies"{
    default={}
}
