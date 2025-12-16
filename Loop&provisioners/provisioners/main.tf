provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0fa91bc90632c73c9"
  instance_type = "t3.micro"
  key_name      = "Ubkey"

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


  provisioner "file" {
    source      = "./index.html"
    destination = "/home/ubuntu/index.html"
  }


  provisioner "local-exec" {
    command = "echo 'Index.html copied to EC2 successfully'"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo mv /home/ubuntu/index.html /var/www/html/index.html",
      "sudo systemctl restart nginx"
    ]
  }
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}