sub_ids = {
  it_sandbox = {
    sub_id = "6df8a527-d5f6-4e32-bec8-08be5fc2e1f2"
  }
}

rg = {
  name     = "rg-demomod101-eus-azr-01"
  location = "eastus"
  tags = {
    Owner       = "HashiCorp"
    Location    = "EastUS"
    Environment = "Sandbox"
  }
}

vnets = {
  vnet_alpha = {
    name                = "vnet-modules-01"
    resource_group_name = "rg-demomod101-eus-azr-01"
    location            = "eastus"
    address_space = [
      "10.0.0.0/19"
    ]
    subnets = {
      subnet_01 = {
        name           = "subnet-web-01"
        address_prefix = "10.0.0.0/24"
      }
      subnet_02 = {
        name           = "subnet-web-02"
        address_prefix = "10.0.1.0/24"
      }
      subnet_03 = {
        name           = "subnet-web-03"
        address_prefix = "10.0.2.0/24"
      }
    }
  }
}

stgaccnts = {
    accnt_alpha = {
        name = "stgdevmoddemoeus001"
        account_tier = "Standard"
        account_rep_type = "LRS"
        }
}

stgaccounts = {
  account_alpha = {
    accntname = "stgdevshowdemo001"
    rgname    = "rg-demomod101-eus-azr-01"
    location  = "eastus"
    tier      = "Standard"
    repl_type = "LRS"
  }
}

containers = {
  container_alpha = {
    name           = "democontainer01"
    stg_accnt_name = "stgdevshowdemo001"
    access_type    = "private"
  }
}