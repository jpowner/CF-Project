provider "aws" {
  region = local.region
  default_tags {
    tags = {
      Project     = local.project
      Environment = local.environment
    }
  }
}

locals {
  project     = "CF-Project"
  environment = "dev"
  region      = "us-east-1"
}

module "network" {
  source             = "../modules/network"
  cidr_block         = "10.1.0.0/16"
  public_subnets     = ["10.1.0.0/24", "10.1.1.0/24"]
  private_subnets    = ["10.1.2.0/24", "10.1.3.0/24"]
  availability_zones = data.aws_availability_zones.available.names
}

data "aws_availability_zones" "available" {
  state = "available"
}