variable servers {
  description = "A map of servers with properties to create"
  type        = map(object({
    sec_groups  = list(string)
    subnet    = string
    inst_ami  = string
    inst_type = string
    vol_size  = number
    vol_type  = string    
    vol_az    = optional(string, "us-east-1a")
    tags      = map(string)
  }))
}

variable requires_eip {
  description = "A list of server names the require an elastic ip"
  type        = list(string)
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

variable sec_group_ids {
  description = "A map of ids for each sec group"
  type        = any
}
