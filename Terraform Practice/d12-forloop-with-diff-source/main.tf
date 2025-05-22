variable "port_source_map"  {
    default = {
        22 = ["192.168.1.0/24"]
        80 = ["0.0.0.0/0"]
        443 = ["0.0.0.0/0"]
        8080 = ["203.0.113.0/24"]
        9000 = ["10.0.0.0/16"]
    }
}
resource "aws_security_group" "sg1" {
    name = "sg1"
    ingress = [
        for port, sources in var.port_source_map : {
            description = "Inbound rule for port ${port}"
            from_port = port
            to_port = port
            protocol = "tcp"
            cidr_blocks = sources
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]  
}