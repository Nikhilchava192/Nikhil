resource "aws_instance" "web" {
    ami = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    key_name = "Demo"
    
    root_block_device {
      volume_size = 40
    }
}
resource "aws_security_group" "sg" {
    name = "sg"
    description = "allow tls inbound traffic"
    ingress = [
        for port in [22,88,443,8080,9000,3000,8082,8081] :{
            description = "inbound rules"
            from_port   = port
            to_port     = port
            protocol   = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]
    egress {
            from_port   = 0
            to_port     = 0
            protocol   = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    tags = {
        Name = "sg"
    }
}