resource "aws_elb" "hana-doitaesy-lb" {
    name                        = "hana-doitaesy-lb"
    subnets                     = [aws_subnet.hana-doiteasy-subnet-1.id, aws_subnet.hana-doiteasy-subnet-2.id]
    security_groups         = [aws_security_group.hana-doiteasy-lb-sg.id]
    listener {
        instance_port       = 3000
        instance_protocol   = "tcp"
        lb_port             = 80
        lb_protocol         = "tcp"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "HTTP:3000/"
        interval            = 30
    }

    instances                   = [aws_instance.hana-app-1.id, aws_instance.hana-app-2.id]
    cross_zone_load_balancing   = true

    tags = {
        Name = "hana-doiteasy-lb"
    }
}