data "aws_vpc" "hana-vpc-1" {
    filter {
        name   = "tag:Name"
        values = [var.vpc_name]
    }
}

data "aws_subnet" "hana-doiteasy-subnet-1" {
    filter {
        name = "tag:Name"
        values = [var.subnet1_name]
    }
}
data "aws_subnet" "hana-doiteasy-subnet-2" {
    count = var.single_target ? 0 : 1
    filter {
        name = "tag:Name"
        values = [var.subnet2_name]
    }
}