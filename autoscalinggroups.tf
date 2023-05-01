resource "aws_launch_configuration" "aws_launch_configuration_alpha" {
  name_prefix     = "aws_launch_configuration_alpha"
  image_id        = var.ami
  instance_type   = var.instance_type
  user_data       = file("user-data.sh")
  security_groups = [aws_security_group.aws_security_group_alpha.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "aws_autoscaling_group_alpha" {
  name                 = "aws_autoscaling_group_alpha"
  min_size             = 2
  max_size             = 5
  desired_capacity     = 3
  launch_configuration = aws_launch_configuration.aws_launch_configuration_alpha.name
  vpc_zone_identifier  = [aws_subnet.aws_subnet_zonea_public_alpha.id, aws_subnet.aws_subnet_zoneb_public_alpha.id]

  tag {
    key                 = "Name"
    value               = "alpha-auto-scaling-group"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "aws_autoscaling_attachment_load_balancer" {
  autoscaling_group_name = aws_autoscaling_group.aws_autoscaling_group_alpha.id
  alb_target_group_arn   = aws_lb_target_group.aws_lb_target_group_alpha.arn
}

