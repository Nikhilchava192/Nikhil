resource "aws_s3_bucket" "name" {
  bucket = "prac20001"
}
resource "aws_s3_bucket_versioning" "versioning_example" {
    bucket = aws_s3_bucket.name.id
    versioning_configuration {
      status = "Enabled"
    }
}
 terraform {
backend "s3" {
    bucket         = "prac2003"  
    region         =  "us-east-1"
    key            = "terraform.tfstate" 
    key1            = ".terraform.lock.hcl"
    encrypt        = true 
  }
}