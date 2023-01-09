variable "public_subnet_ids" {
  description = "List of the public subnet IDs"
  type        = list(string)
}

variable "load_balancer_type" {
  description = "Value of the load balancer type"
  type        = string
}

variable "asg_name" {
  description = "Value of the auto scaling group name"
  type        = string
}

variable "vpc_id" {
  description = "Value of the VPC ID"
  type        = string
}

variable "port" {
  description = "Value of the port the load balancer is listening to"
  type        = number
}

variable "protocol" {
  description = "Value of the load balancer protocol"
  type        = string
}

variable "listener_action_type" {
  description = "Value of the listener default action type"
  type        = string
  default     = "forward"
}

variable "security_groups" {
  description = "List of the security groups for the load balancer"
  type        = list(string)
}