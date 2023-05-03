
resource "aws_lb" "aws_lb_alpha" {
  name               = "aws-lb-alpha"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aws_security_group_alpha.id]
  subnets            = [aws_subnet.aws_subnet_zonea_public_alpha.id, aws_subnet.aws_subnet_zoneb_public_alpha.id]
}

resource "aws_lb_target_group" "aws_lb_target_group_alpha" {
  name     = "aws-lb-target-group-alpha"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = aws_vpc.aws_vpc_alpha.id
}

resource "aws_lb_listener" "aws_lb_listener_alpha" {
  load_balancer_arn = aws_lb.aws_lb_alpha.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_target_group_alpha.arn
  }
}
