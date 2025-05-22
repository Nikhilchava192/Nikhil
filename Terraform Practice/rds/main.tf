resource "aws_db_instance" "myrds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  identifier = "myrds"
  username = "Nikhil"
  password = "NatsuD#2003"
  skip_final_snapshot = true

}