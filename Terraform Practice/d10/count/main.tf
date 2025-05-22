resource "aws_instance" "test" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    count = length(var.sandboxes)
    tags = {
        # Name = "TP"
        # Name = "TP-${count.index}"
        Name = var.sandboxes[count.index]
    }
}
variable "sandboxes" {
    type = list(string)
    default = ["sand1", "sand2" , "sand3"]
}