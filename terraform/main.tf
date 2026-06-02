terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source                = "./modules/subnet"
  vpc_id                = module.vpc.vpc_id
  public_subnets_cidrs  = var.public_subnets_cidrs
  azs                   = data.aws_availability_zones.available.names
  public_route_table_id = module.vpc.public_route_table_id
  vpc_name              = var.vpc_name
}

module "ec2" {
  source          = "./modules/ec2"
  subnet_id       = module.subnets.public_subnet_ids[0]
  instance_type   = var.instance_type
  key_name        = var.key_name
  public_key_path = var.public_key_path
  vpc_id          = module.vpc.vpc_id
  vpc_name        = var.vpc_name
}

module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name
  s3_versioning  = var.s3_versioning
  vpc_name       = var.vpc_name
}



