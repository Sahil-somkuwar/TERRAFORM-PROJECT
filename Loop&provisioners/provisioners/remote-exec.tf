provider "aws" {
    region = "eu-north-1"  
}

resource "aws_instance" "my_instance" {
    ami =  "ami-0fa91bc90632c73c9"
    instance_type = "t3.micro"
    key_name = "Ubkey"

    tags = {
        Name = "My_instance_1"
        env  = "dev"
    }
    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("Ubkey.pem")
    host        = self.public_ip
}

provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl restart nginx"
    ]
  }
}