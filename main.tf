module "storage" {
  source = "./aws_modules/storage"
  servers = var.servers
}

module "network" {
  source        = "./aws_modules/network"
  vpcs          = var.vpcs
  subnets       = var.subnets
  sec_groups    = var.sec_groups
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  servers       = var.servers
  route_tables  = var.route_tables
  routes        = var.routes
}

module "compute" {
  source      = "./aws_modules/compute"
  servers     = var.servers
  vol_ids     = module.storage.ebs_vol_ids
  vol_azs     = module.storage.ebs_vol_azs
  subnet_ids  = module.network.subnet_ids
  sec_group_ids = module.network.instance_sec_group_map
}
