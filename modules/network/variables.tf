variable "cidr_block" {
  description = "Value of the CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List containing the public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List containing the private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "List containing availability zones"
  type        = list(string)
}