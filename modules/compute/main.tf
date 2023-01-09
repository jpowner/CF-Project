resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  root_block_device {
    volume_size = var.root_volume_size
  }
  iam_instance_profile = var.ssm_role_profile_name
  user_data            = filebase64("${path.module}/templates/init.sh")
}