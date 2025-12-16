provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "my_instance" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = "My_instance_1"
        env  = var.env
    }
  
}