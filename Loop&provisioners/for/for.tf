terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
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
    count = 3
  
}


output "public_ip" {
    value = {for server, instance in aws_instance.my_instance:server=> instance.public_ip}
  
}