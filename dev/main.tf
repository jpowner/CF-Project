provider "aws" {
  region = local.region
  default_tags {
    tags = {
      project = local.project
      environment = local.environment
    }
  }
}

locals {
  name_suffix = "${local.project}-${local.environment}"
  project     = "CF-Project"
  environment = "dev"
  region      = "us-east-1"
}