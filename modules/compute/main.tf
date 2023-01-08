resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  root_block_device {
    volume_size = var.root_volume_size
  }
}