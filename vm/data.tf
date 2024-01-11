data "azurerm_resource_group" "rsi_rg" {
  name = "rsi_rg"
}

data "azurerm_subnet" "example_subnet" {
  name                 = "subnet1" # Replace with your actual subnet name
  virtual_network_name = var.vnet1
  resource_group_name  = data.azurerm_resource_group.rsi_rg.name
}

