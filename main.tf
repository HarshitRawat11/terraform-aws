module "networking" {
  source           = "./networking"
  vpc_cidr         = local.vpc_cidr
  access_ip        = var.access_ip
  security_groups  = local.security_groups
  public_sn_count  = 2
  private_sn_count = 3
  public_cidrs     = [for i in range(2, 6, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  private_cidrs    = [for i in range(1, 6, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  max_subnet       = 10
  db_subnet_group  = true
}

module "database" {
  source                 = "./database"
  db_storage             = 10
  db_engine_version      = "5.7.22"
  db_instance_class      = "db.t2.micro"
  dbname                 = "terraform-rds"
  dbuser                 = "rawat"
  dbpassword             = "rawat@1234"
  db_identifier          = "rds-db"
  skip_db_snapshot       = true
  db_subnet_group_name   = module.networking.db_subnet_group_name[0]
  vpc_security_group_ids = module.networking.db_security_group_ids
}