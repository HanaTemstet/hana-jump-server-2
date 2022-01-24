resource "aws_vpc" "hana-vpc-1" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "hana-vpc-1"
    }
}

resource "aws_subnet" "hana-doiteasy-subnet-1" {
    vpc_id            = aws_vpc.hana-vpc-1.id
    cidr_block        = "10.0.0.0/28"
    availability_zone = "sa-east-1a"

    tags = {
        Name = "hana-doiteasy-subnet-1"
    }
}

resource "aws_subnet" "hana-doiteasy-subnet-2" {
    vpc_id            = aws_vpc.hana-vpc-1.id
    cidr_block        = "10.0.1.0/28"
    availability_zone = "sa-east-1c"

    tags = {
        Name = "hana-doiteasy-subnet-2"
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
        cidr_block = "0.0.0.0/0"
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