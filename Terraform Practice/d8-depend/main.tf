provider "aws" { 
    region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "Practf"
  depends_on = [ aws_instance.dev ]
}

resource "aws_instance" "dev" {
    ami = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    
}