module "security_groups" {
  source = "./sec_groups"
}

module "key_pairs" {
  source = "./key_pairs"
}

module "ansible_ctrl_node" {
  source = "./ansible"
}