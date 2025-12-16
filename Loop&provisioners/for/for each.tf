provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0fa91bc90632c73c9"
    for_each = toset(var.instance_type)
    instance_type  = each.value

    tags = {
        Name = "Instance-${each.key}"
        env  = "dev"
    }
  
}

variable "instance_type" {
    default = ["t3.micro", "t3.small"]
}