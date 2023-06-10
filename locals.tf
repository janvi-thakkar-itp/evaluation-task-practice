locals{
    tags={
        Owner=var.Owner
        lab=var.lab
    }  

    instances=[
        {
        name  = "server1",
        subnet_id=module.vpc.public_subnets[0]
    },
    {
        name  = "server2",
        subnet_id=module.vpc.public_subnets[1]
    },
    {
        name  = "server3",
        subnet_id=module.vpc.public_subnets[2]
    }
    ]
}