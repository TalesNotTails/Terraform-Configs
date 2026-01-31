variable servers {
  description = "A map of servers with properties to create"
  type        = map(object({
    vol_size  = number
    vol_type  = string    
    vol_az    = string
  }))
}

variable requires_storage {
  description = "A list of server names that require persistent storage"
  type        = list(string)
}
