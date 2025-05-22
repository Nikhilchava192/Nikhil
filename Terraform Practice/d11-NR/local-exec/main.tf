provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "myrds" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t2.micro"
    identifier = "mydb"
    username = "Nikhil"
    password = "Nikhil@2003"
    skip_final_snapshot = true
    publicly_accessible = false
    vpc_security_group_ids = [aws_security_group.sg.id]
}
resource "aws_security_group" "sg" {
  name = "sg"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "null_resource" "db_initializer" {
    depends_on = [ aws_db_instance.myrds]
    provisioner "local-exec" {
        command = <<EOT
        mysql -h ${aws_db_instance.myrds.address}
        -u Nikhil \
        -p Nikhil@2003 \
        -e "source ./initialize_db.sql"
        EOT
    }
    triggers = {
        db_instance_id = aws_db_instance.myrds.id
    }
}