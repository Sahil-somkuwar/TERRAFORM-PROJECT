resource "aws_lb_target_group" "my_tg" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id   # <---- Replace with VPC ID

  health_check {
    path = "/"
    protocol = "HTTP"
  }
}