variable "ami" {
    description = "inserting ami value"
    type =  string
    default = "ami-0e449927258d45bc4"

}

variable "type" {
  description = "inserting value for instance type"
    type =  string
    default = "t2.micro"
}

variable "key" {
  description = "inserting value for key name"
    type =  string
    default = "Demo"
}

variable "az" {
  description = "inserting value for az"
    type =  string
    default = "us-east-1a"
}