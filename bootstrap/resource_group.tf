// Creates a resource group called rsi_rg \\
resource "azurerm_resource_group" "rsi_rg" {
  name     = "rsi_rg"
  location = "uksouth"
}