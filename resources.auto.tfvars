servers = {
  babe_mc_server = {
    subnet    = "mc_subnet"
    pub_ip    = true
    inst_ami  = "ami-0e9e3701ddd593b08"
    inst_type = "t3a.small"
    vol_size  = 10
    vol_type  = "gp3"
    vol_az    = "us-east-1a"
    sec_groups  = ["allow_ssh"]
    tags      = {
      name = "babe_mc_server"
    }
  },
  discord_mc_server = {
    subnet    = "mc_subnet"
    pub_ip    = true
    inst_ami  = "ami-0e9e3701ddd593b08"
    inst_type = "t3a.medium"
    vol_size  = 10
    vol_type  = "gp3"
    vol_az    = "us-east-1a"
    sec_groups  = ["allow_ssh"]
    tags      = {
      name = "discord_mc_server"
    }
  }
}

vpcs  = {
  main_vpc  = {
    region  = "us-east-1"
    cidr_block  = "10.0.0.0/16"
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
