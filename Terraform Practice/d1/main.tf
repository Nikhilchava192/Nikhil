resource "aws_instance" "ec2p" {

    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.az
}