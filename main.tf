terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr         = var.vpc_cidr
  vpc_name         = var.vpc_name
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  availability_zones = var.availability_zones
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id         = module.vpc.vpc_id
  vpc_name       = var.vpc_name
  allowed_cidrs  = var.allowed_cidrs
}

module "ec2_instances" {
  source = "./modules/ec2_instances"

  instance_count   = var.instance_count
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  subnet_ids       = module.vpc.public_subnet_ids
  security_group_id = module.security_groups.app_sg_id
  vpc_name         = var.vpc_name
}