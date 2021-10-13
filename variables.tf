variable "sub_ids" {
  type = map(object({
    sub_id = string
  }))
}


variable "rg" {
  type = object({
    name     = string
    location = string
    tags = object({
      Owner       = string
      Location    = string
      Environment = string
    })
  })
  description = "This data is passed to the rg submodule to populate values"
}


variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = map(object({
      name           = string
      address_prefix = string
    }))
  }))
  description = "This variable passes in the vnet data same as above to submodule"
}

variable "stgaccnts" {
    type = map(object({
        name = string
        account_tier             = string
        account_rep_type = string
    }))
}

variable "stgaccounts" {
  type = map(object({
    accntname = string
    rgname    = string
    location  = string
    tier      = string
    repl_type = string
  }))

}

variable "containers" {
  type = map(object({
    name        = string
    stg_accnt_name      = string
    access_type = string
  }))
}