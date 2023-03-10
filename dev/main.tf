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

module "compute" {
  source                = "../modules/compute"
  ami                   = data.aws_ami.rhel_9.id
  instance_type         = "t2.micro"
  public_subnet_id      = module.network.public_subnet_ids[1]
  root_volume_size      = 20
  ssm_role_profile_name = module.security.ssm_role_profile_name
}

data "aws_ami" "rhel_9" {
  owners = ["309956199498"] # Red Hat
  filter {
    name   = "name"
    values = ["RHEL-9.1.0_HVM-20221101-x86_64-2-Hourly2-GP2"]
  }
}

module "autoscaling" {
  source              = "../modules/autoscaling"
  ami                 = data.aws_ami.rhel_9.id
  instance_type       = "t2.micro"
  max_size            = 6
  min_size            = 2
  volume_size         = 20
  vpc_zone_identifier = module.network.private_subnet_ids
  security_groups     = [module.security.private_subnet_instances_sg_id]
}

module "loadbalancer" {
  source             = "../modules/loadbalancer"
  load_balancer_type = "application"
  public_subnet_ids  = module.network.public_subnet_ids
  asg_name           = module.autoscaling.autoscaling_group_id
  vpc_id             = module.network.vpc_id
  port               = 80
  protocol           = "HTTP"
  security_groups    = [module.security.load_balancer_sg_id]
}

module "security" {
  source           = "../modules/security"
  vpc_id           = module.network.vpc_id
}

module "storage" {
  source = "../modules/storage"
}