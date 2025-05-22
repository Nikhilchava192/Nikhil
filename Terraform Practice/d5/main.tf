#creating vpc
resource "aws_vpc" "dev_local" {
    cidr_block = "10.0.0.0/24"
}
#creating subnet
resource "aws_subnet" "dev_local" {
    vpc_id = aws_vpc.dev_local.id
    cidr_block = "10.0.0.0/28"
}
#creating internet gateway
resource "aws_internet_gateway" "dev_local"{
    vpc_id = aws_vpc.dev_local.id
}
#creating route table
resource "aws_route_table" "dev_rt" {
    vpc_id = aws_vpc.dev_local.id
    route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.dev_local.id
    }
}
#creating subnet association
resource "aws_route_table_association" "dev_local"{
    subnet_id = aws_subnet.dev_local.id
    route_table_id = aws_route_table.dev_rt.id
}
#creating security group
resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    vpc_id = aws_vpc.dev_local.id
 ingress {
    description = "Traff"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
    description = "Traff"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}