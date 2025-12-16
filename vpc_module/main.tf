provider "aws" {
region = "ap-south-1"  
}

module "vpc" {
  source = "./vpc"

  vpc_cidr_block         = "172.0.0.0/16"
  vpc_cidr_pub_subnet    = "172.0.0.0/20"
  vpc_cidr_pri_subnet    = var.vpc_cidr_pri_subnet
}