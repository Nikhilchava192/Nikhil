resource "aws_instance" "name" {
    ami = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    key_name = "Demo"
    user_data = file("script.sh")
}