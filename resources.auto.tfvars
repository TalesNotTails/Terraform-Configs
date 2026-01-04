servers = {
  babe_mc_server = {
    subnet    = "mc_subnet"
    pub_ip    = true
    inst_ami  = "ami-0e9e3701ddd593b08"
    inst_type = "t3a.small"
    vol_size  = 10
    vol_type  = "gp3"
    vol_az    = "us-east-1a"
    sec_groups  = ["allow_ssh", "allow_web"]
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
    sec_groups  = ["allow_ssh", "allow_web"]
    tags      = {
      name = "discord_mc_server"
    }
  }
}
