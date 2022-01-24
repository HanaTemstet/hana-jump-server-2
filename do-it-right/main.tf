module "compute" {
    source                      = "./modules/compute"
    depends_on                  = [module.network]
    single_target               = var.single_target
    ami_id                      = var.ami_id
    instance_type               = var.instance_type
    associate_public_ip_address = var.associate_public_ip_address
    instace_key_name            = var.instace_key_name
    instance_name_1             = var.instance_name_1
    instance_name_2             = var.instance_name_2
    lb_name                     = var.lb_name
    vpc_name                    = var.vpc_name
    subnet1_name                = var.subnet1_name
    subnet2_name                = var.subnet2_name 
}

module "network" {
    source = "./modules/network"
    single_target = var.single_target
    vpc_cidr      = var.vpc_cidr
    vpc_name      = var.vpc_name
    igw_name      = var.igw_name
    route_table_cidr=var.route_table_cidr
    igw_route_name= var.igw_route_name
    subnet1_cidr  = var.subnet1_cidr
    subnet1_az    = var.subnet1_az
    subnet1_name  = var.subnet1_name
    subnet2_cidr  = var.subnet2_cidr
    subnet2_az    = var.subnet2_az
    subnet2_name  = var.subnet2_name
}




