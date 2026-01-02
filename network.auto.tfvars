vpcs  = {
  main_vpc  = {
    region  = "us-east-1"
    cidr_block  = "10.0.0.0/16"
  } 
}

route_tables = {
  mc_route_table  = {
    vpc = "main_vpc"
    subnet  = "mc_subnet"
  }
}

routes  = {
  default_route = {
    gateway     = "main_gateway"
    cidr_block  = "0.0.0.0/0"
    route_table = "mc_route_table"
  }
}

subnets = {
  mc_subnet = {
    cidr_block  = "10.0.1.0/24"
    vpc = "main_vpc"  
    az  = "us-east-1a"
  }
}

sec_groups  = {
  allow_ssh = {
    name  = "allow_ssh_SG"
    description = "Allows ssh from external networks"
    vpc = "main_vpc"
  }
}

ingress_rules = {
  allow_ssh_rule = {
    sec_group  = "allow_ssh" 
    ip_protocol     = "tcp"
    cidr_ipv4       = "0.0.0.0/0"
    from_port       = 22
    to_port         = 22
    servers         = ["discord_mc_server"]
  } 
}

egress_rules  = {
  allow_ssh_rule = {
    sec_group  = "allow_ssh"
    ip_protocol     = "tcp"
    cidr_ipv4       = "0.0.0.0/0"
    from_port       = 22
    to_port         = 22
  } 
}
