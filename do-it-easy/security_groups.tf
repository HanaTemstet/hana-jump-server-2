resource "aws_security_group" "hana-doiteasy-sg" {
    name        = "hana-doiteasy-sg"
    description = "hana-doiteasy-sg"
    vpc_id      = aws_vpc.hana-vpc-1.id

    ingress {
        description     = "Allow port 3000 from loadbalancer security group"
        from_port       = 3000
        to_port         = 3000
        protocol        = "tcp"
        security_groups = [aws_security_group.hana-doiteasy-lb-sg.id]
    }

    ingress {
        description         = "Allow SSH from jump_server_sg"
        from_port           = 22
        to_port             = 22
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"] 
        ipv6_cidr_blocks    = ["::/0"] 
    }

    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"] 
        ipv6_cidr_blocks    = ["::/0"] 
    }

    tags = {
        Name = "hana-doiteasy-sg"
    }
}

resource "aws_security_group" "hana-doiteasy-lb-sg" {
    name        = "hana-doiteasy-lb-sg"
    description = "hana-doiteasy-lb-sg"
    vpc_id      = aws_vpc.hana-vpc-1.id

    ingress {
        description      = "HTTP from VPC"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] 
        ipv6_cidr_blocks = ["::/0"] 
    }

    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"] 
        ipv6_cidr_blocks    = ["::/0"] 
    }

    tags = {
        Name = "hana-doiteasy-lb-sg"
    }
}