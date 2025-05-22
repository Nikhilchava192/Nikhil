provider "aws" {
    region = "us-east-1"
  
}
module "dev" {
    source = "../d1"
    ami = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    key_name = "Demo"
}