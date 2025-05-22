module "Nikhil" {
    source = "github.com/Nikhilchava192/Nikhil.git"
    ami = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    key_name = "Demo"
}