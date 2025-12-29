variable vpcs {
  description = "A map of vpcs with properties to create"
  type        = map(object({
    region      = string
    cidr_block  = string
  }))
}

variable subnets {
  description = "A map of subnets with properties to create"
  type        = map(object({
    vpc         = string
    cidr_block  = string
    az          = string
  }))
}

variable sec_groups {
  description = "A map of security groups"
  type        = map(object({
    name        = string
    description = string
    vpc         = string
  }))
}

variable ingress_rules {
  description = "A map of ingress_rules"
  type        = map(object({
    sec_group  = string
    ip_protocol     = string
    cidr_ipv4       = string
    from_port       = number
    to_port         = number
  }))
}

variable egress_rules {
  description = "A map of egress_rules"
  type        = map(object({
    sec_group  = string
    ip_protocol     = string
    cidr_ipv4       = string
    from_port       = number
    to_port         = number
  }))
}

