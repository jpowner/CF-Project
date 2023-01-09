variable "ingress_port" {
  description = "Value of the ingress port"
  type        = number
}

variable "egress_port" {
  description = "Value of the egress port"
  type        = number
}

variable "ingress_protocol" {
  description = "Value of the ingress protocol"
  type        = string
}

variable "egress_protocol" {
  description = "Value of the egress protocol"
  type        = string
}

variable "lb_sg_cidrs" {
  description = "Value of the default route to allow access from any IP"
  type        = list(string)
}

variable "vpc_id" {
  description = "Value of the VPC ID"
  type        = string
}