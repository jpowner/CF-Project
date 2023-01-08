variable "ami" {
  description = "Value of the AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Value of the instance type"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "List of the subnet IDs to launch resources in"
  type        = list(string)
}

variable "max_size" {
  description = "Value of the max size"
  type        = number
}

variable "min_size" {
  description = "Value of the min size"
  type        = number
}

variable "volume_size" {
  description = "Value of the volume size"
  type        = number
}

variable "device_name" {
  description = "Value of the device name"
  type        = string
  default     = "/dev/sda1"
}

variable "launch_template_version" {
  description = "Value of the launch template version"
  type        = string
  default     = "$Latest"
}