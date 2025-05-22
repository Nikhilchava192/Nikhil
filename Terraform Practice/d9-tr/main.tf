resource "aws_instance" "Dependent" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
}
resource "aws_s3_bucket" "Dependent" {
    bucket = "Prac2003"
}
# terraform apply -target=aws_s3_bucket.Dependent
# terraform destroy -target=aws_s3_bucket.Dependent