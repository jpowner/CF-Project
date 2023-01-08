resource "aws_lb" "load_balancer" {
  subnets            = var.private_subnet_ids
  load_balancer_type = var.load_balancer_type
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.port
  protocol          = var.protocol
  default_action {
    type             = var.listener_action_type
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}

resource "aws_lb_target_group" "lb_target_group" {
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}

resource "aws_autoscaling_attachment" "autoscaling_attachment" {
  autoscaling_group_name = var.asg_name
  lb_target_group_arn    = aws_lb_target_group.lb_target_group.arn
}