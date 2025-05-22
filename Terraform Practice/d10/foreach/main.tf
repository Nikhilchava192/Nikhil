resource "aws_instance" "test" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    for_each = toset(var.sandboxes)
    # tags = {
    #     # Name = "TP"
    #     # Name = "TP-${count.index}"
    #     Name = var.sandboxes[count.index]
    # }
    tags = {
      Name = each.value
    }
}