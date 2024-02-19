data "azurerm_resource_group" "rsi_rg" {
  name = "rsi_rg"
}

data "azurerm_network_interface" "nic1" {
  name                = "myNIC1"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
}

data "azurerm_network_interface" "nic2" {
  name                = "myNIC2"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
}

