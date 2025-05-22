variable "ami" {
    type = string
    default = "ami-0e449927258d45bc4"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    default = "Demo"
  
}
variable "name" {
  description = "The name of the EC2 instance."
  default = "Prac"
}