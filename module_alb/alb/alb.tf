resource "aws_lb" "my_alb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group
  subnets            = var.subnets
}

# Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}