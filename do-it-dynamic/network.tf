resource "aws_vpc" "hana-vpc-1" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "hana-doiteasy-subnet-1" {
    vpc_id            = aws_vpc.hana-vpc-1.id
    cidr_block        = var.subnet1_cidr
    availability_zone = var.subnet1_az

    tags = {
        Name = var.subnet1_name
    }
}

resource "aws_subnet" "hana-doiteasy-subnet-2" {
    vpc_id            = aws_vpc.hana-vpc-1.id
    cidr_block        = var.subnet2_cidr
    availability_zone = var.subnet2_az

    tags = {
        Name = var.subnet2_name
    }
}

resource "aws_internet_gateway" "hana-igw" {
    vpc_id = aws_vpc.hana-vpc-1.id

    tags = {
        Name = "hana-igw"
    }
}

resource "aws_route_table" "hana-igw-route" {
    vpc_id = aws_vpc.hana-vpc-1.id

    route {
        cidr_block = var.route_table_cidr
        gateway_id = aws_internet_gateway.hana-igw.id
    }

    tags = {
        Name = "hana-igw-route"
    }
}

resource "aws_main_route_table_association" "hana-igw-route" {
    vpc_id          = aws_vpc.hana-vpc-1.id
    route_table_id  = aws_route_table.hana-igw-route.id
}