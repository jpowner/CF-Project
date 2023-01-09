output "ssm_role_profile_name" {
  value = aws_iam_instance_profile.ssm_profile.name
}

output "private_subnet_instances_sg_id" {
  value = aws_security_group.private_subnet_instances_sg.id
}

output "private_subnet_lb_sg_id" {
  value = aws_security_group.private_subnet_lb_sg.id
}