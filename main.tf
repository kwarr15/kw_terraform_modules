provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}

  alias           = "labs"
  subscription_id = var.sub_ids.it_sandbox["sub_id"]
}

module "resgrp" {
  source = "./rg"
  rg     = var.rg
}

module "vnets" {
  source = "./vnet"
  vnets  = var.vnets
  depends_on = [
    module.resgrp
  ]
}

output "rg_name_main" {
    value = module.resgrp.rg_name
    description = "This outputs the name of our resource group!"
}

output "vnet_main" {
    value = module.vnets.vnet_data
    description = "This outputs the vnet"
}

output "vnet_subs" {
    value = module.vnets.vnet_subnets
    description = "This outputs the name of our subnets"
}

// data "azurerm_virtual_network" "vnets_data" {
//   name                = module.vnets.vnet_data["vnet_alpha"].name
//   resource_group_name = module.vnets.vnet_data["vnet_alpha"].resource_group_name
// }

// output "vnet_main_bravo" {
//     value = data.azurerm_virtual_network.vnets_data
//     description = "This outputs the name of our resource group!"
// }


// resource "azurerm_storage_account" "stgaccnts" {
//     for_each = var.stgaccnts
//   name                     = each.value["name"]
//   resource_group_name      = module.resgrp.rg_name
//   location                 = module.resgrp.rg_location
//   account_tier             = each.value["account_tier"]
//   account_replication_type = each.value["account_rep_type"]
// }

module "storage" {
  providers = {
    azurerm.strgaccnttarget = azurerm.labs
  }
  source      = "github.com/johhess40/Terraform/azure/modules/storage/basestrg"
  stgaccounts = var.stgaccounts
  containers  = var.containers
  depends_on = [
    module.resgrp
  ]
}