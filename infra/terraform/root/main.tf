provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "security_group" {
  source = "./modules/security_group"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  vpc_cidr     = var.vpc_cidr
  admin_cidr   = var.admin_cidr
}

module "compute" {
  source = "./modules/compute"

  project_name             = var.project_name
  ami_id                   = var.ami_id
  instance_type            = var.instance_type
  key_name                 = var.key_name
  worker_count             = var.worker_count
  subnet_ids               = module.network.public_subnet_ids
  security_group_id        = module.security_group.security_group_id
  associate_public_address = var.associate_public_address
}

