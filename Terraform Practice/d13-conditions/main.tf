resource "random_string" "suffix" {
  count   = var.create_bucket ? 1 : 0
  length  = 8
  special = false
  upper   = false
}
resource "aws_s3_bucket" "example" {
  count = var.create_bucket ? 1 : 0
  bucket = "my-bucket-${random_string.suffix[count.index].id}"
  tags = {
    Name        = "ConditionalBucket"
    Environment = "Dev"
  }
}
# resource "aws_instance" "example" {
#   count         = var.create_instance ? 1 : 0
#   ami           = "ami-0440d3b780d96b29d"
#   instance_type = "t2.micro"
# }