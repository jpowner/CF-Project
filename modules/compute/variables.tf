variable "public_subnet_id" {
  description = "Value of the public subnet ID"
  type        = string
}

variable "instance_type" {
  description = "Value of the instance type"
  type        = string
}

variable "ami" {
  description = "Value of the AMI"
  type        = string
}

variable "root_volume_size" {
  description = "Value of the root volume size"
  type        = number
}

variable "ssm_role_profile_name" {
  description = "Value of the IAM SSM role profile name"
  type        = string
}