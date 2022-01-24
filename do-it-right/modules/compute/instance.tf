resource "aws_instance" "hana-app-1" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = data.aws_subnet.hana-doiteasy-subnet-1.id
    associate_public_ip_address = var.associate_public_ip_address
    key_name                    = var.instace_key_name
    vpc_security_group_ids       = [aws_security_group.hana-doiteasy-sg.id]
    tags = {
        Name = var.instance_name_1
    }
}


resource "aws_instance" "hana-app-2" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.single_target ? data.aws_subnet.hana-doiteasy-subnet-2[0].id : data.aws_subnet.hana-doiteasy-subnet-2[0].id
    associate_public_ip_address = var.associate_public_ip_address
    key_name                    = var.instace_key_name
    vpc_security_group_ids       = [aws_security_group.hana-doiteasy-sg.id]
    tags = {
        Name = var.instance_name_2
    }
}
