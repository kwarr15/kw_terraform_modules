// provider "azurerm" {
//   features {}
// }

resource "azurerm_resource_group" "rg" {
  //   provider = azurerm.rgtarget
  name     = var.rg.name
  location = var.rg.location
  tags     = var.rg.tags
}