data "azurerm_resource_group" "rsi_rg" {
  name = "rsi_rg"
}

data "azurerm_network_security_group" "sg_1" {
  name                = "sg_1"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  depends_on          = [azurerm_network_security_group.sg_1]
}

data "azurerm_network_security_group" "sg_2" {
  name                = "sg_2"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  depends_on          = [azurerm_network_security_group.sg_2]
}