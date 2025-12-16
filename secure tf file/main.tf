terraform {
  backend "s3" {
    bucket = "myadityakadu"
    key    = "terraform.tfstate"
    region = "eu-north-1"

    
   
  }
}


provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0fa91bc90632c73c9"
    instance_type = "t3.micro"
    tags = {
        Name = "My_instance_1"
        env  = "dev"
    }
  
}