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
variable "sandboxes" {
    type = list(string)
    default = ["sand1","sand2","sand3"]
}