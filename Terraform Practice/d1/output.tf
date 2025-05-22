output "name" {
    description = "print public ip"
    value = aws_instance.ec2p.public_ip
}