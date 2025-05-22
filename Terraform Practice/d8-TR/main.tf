module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "Demo"
  monitoring             = true
  subnet_id              = "subnet-02a20fd4daab10698"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}