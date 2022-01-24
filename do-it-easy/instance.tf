resource "aws_instance" "hana-app-1" {
    ami                         = "ami-0056d4296b1120bc3"
    instance_type               = "t2.micro"
    subnet_id                   = aws_subnet.hana-doiteasy-subnet-1.id
    associate_public_ip_address = true
    key_name                    = "hana-sao-paulo-key"
    vpc_security_group_ids       = [aws_security_group.hana-doiteasy-sg.id]
    tags = {
        Name = "hana-app-1"
    }
}


resource "aws_instance" "hana-app-2" {
    ami                         = "ami-0056d4296b1120bc3"
    instance_type               = "t2.micro"
    subnet_id                   = aws_subnet.hana-doiteasy-subnet-2.id
    associate_public_ip_address = true
    key_name                    = "hana-sao-paulo-key"
    vpc_security_group_ids       = [aws_security_group.hana-doiteasy-sg.id]
    tags = {
        Name = "hana-app-2"
    }
}
