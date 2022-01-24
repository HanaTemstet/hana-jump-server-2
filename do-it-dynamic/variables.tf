variable "vpc_cidr"{
    type =string
    default = "10.0.0.0/16"
}
variable "vpc_name"{
    type =string
    default = "hana-vpc-1"
}

/*  */

variable "subnet1_cidr"{
    type =string
    default = "10.0.0.0/28"
}
variable "subnet2_cidr"{
    type =string
    default = "10.0.1.0/28"
}
variable "subnet1_az"{
    type =string
    default = "sa-east-1a"
}
variable "subnet2_az"{
    type =string
    default = "sa-east-1c"
}
variable "subnet1_name"{
    type =string
    default = "hana-doiteasy-subnet-1"
}
variable "subnet2_name"{
    type =string
    default = "hana-doiteasy-subnet-2"
}
/*  */
/* variable "igw_name"{
    type =string
    default = "hana-igw"
}
variable "igw_route_name"{
    type =string
    default = "hana-igw-route"
} */
variable "route_table_cidr"{
    type =string
    default = "0.0.0.0/0"
}

/*  */


variable "ami_id"{
    type =string
    default = "ami-0056d4296b1120bc3"
}
variable "instance_type"{
    type =string
    default = "t2.micro"
}
variable "associate_public_ip_address"{
    type =bool
    default = true
}
variable "instace_key_name"{
    type =string
    default = "hana-sao-paulo-key"
}
variable "instance_name_1"{
    type =string
    default = "hana-app-1"
}
variable "instance_name_2"{
    type =string
    default = "hana-app-2"
}
variable "lb_name"{
    type =string
    default = "hana-doiteasy-lb"
}
variable "instance_port"{
    type =string
    default = "3000"
}
variable "instance_protocol"{
    type =string
    default = "tcp"
}
variable "lb_port"{
    type =string
    default = "80"
}
variable "lb_protocol"{
    type =string
    default = "tcp"
}


