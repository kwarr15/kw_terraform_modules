// provider "azurerm" {
//   features {}
// }

/*
This module deploys a single resource group and x amount of vnets to Azure
*/

resource "azurerm_virtual_network" "vnets" {
  // for each object in map var.vnets
  for_each            = var.vnets
  name                = each.value["name"]
  location            = each.value["location"]
  resource_group_name = each.value["resource_group_name"]
  address_space       = each.value["address_space"]

  dynamic "subnet" {
    for_each = each.value["subnets"]
    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address_prefix"]
    }
  }
}

locals {
  subnets = {for k, v in azurerm_virtual_network.vnets: "subnets-${k}" => v.subnet}
  subnets_two = {for k, v in local.subnets: "sub-ids-${k}" => {
    for value in v: "id-data-${value.name}" => value.id
  }}
}