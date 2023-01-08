resource "aws_launch_template" "launch_template" {
  image_id      = var.ami
  instance_type = var.instance_type
  user_data     = filebase64("${path.module}/templates/init.sh")
  block_device_mappings {
    device_name = var.device_name
    ebs {
      volume_size = var.volume_size
    }
  }
}

resource "aws_autoscaling_group" "autoscaling_group" {
  vpc_zone_identifier = var.vpc_zone_identifier
  max_size            = var.max_size
  min_size            = var.min_size

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = var.launch_template_version
  }
}