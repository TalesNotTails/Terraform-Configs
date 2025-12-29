variable servers {
  description = "A map of servers with properties to create"
  type        = map(object({
    subnet    = string
    pub_ip    = bool
    inst_ami  = string
    inst_type = string
    vol_size  = number
    vol_type  = string    
    vol_az    = string
  }))
}

variable vol_azs {
  description = "A map of availability zones that each ebs volume is in"
  type        = any
}

variable vol_ids {
  description = "A map of ids for each volume"
  type        = any
}

variable subnet_ids {
  description = "A map of ids for each subnet"
  type        = any
}
