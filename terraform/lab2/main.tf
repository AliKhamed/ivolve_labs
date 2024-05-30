provider "aws" {
  region = var.region
  profile = "default"
}


module "network" {
  source                 = "./modules/network"
  vpc_cidr               = var.vpc_cidr
  vpc_name               = var.vpc_name
  public_subnet_cidrs    = var.public_subnet_cidrs
  public_subnet_azs      = var.public_subnet_azs
  private_subnet_cidrs   = var.private_subnet_cidrs 
  private_subnet_azs     = var.private_subnet_azs
}

module "ec2" {
  source                 = "./modules/ec2"
  ami                    = var.ami
  sg                     = var.sg         
  instance_type          = var.instance_type
  vpc_id                 = module.network.vpc_id
  public_subnet_ids      = module.network.public_subnet_ids
  
}

module "rds" {
  source                 = "./modules/rds"
  vpc_id              = module.network.vpc_id
  private_subnet_ids  = module.network.private_subnet_ids
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  parameter_group_name= var.parameter_group_name
  skip_final_snapshot = var.skip_final_snapshot
  db_instance_name    = var.db_instance_name
  
}