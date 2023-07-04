module "networking" {
  source           = "./networking"
  vpc_cidr         = local.vpc_cidr
  access_ip        = var.access_ip
  public_sn_count  = 2
  private_sn_count = 3
  public_cidrs     = [for i in range(2, 6, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  private_cidrs    = [for i in range(1, 6, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  max_subnet       = 10
}