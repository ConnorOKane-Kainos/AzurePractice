data "azurerm_resource_group" "rsi_rg" {
  name = "rsi_rg"
}

data "azurerm_subnet" "subnet_one" {
  name                 = "subnet1"
  virtual_network_name = var.vnet1
  resource_group_name  = data.azurerm_resource_group.rsi_rg.name
}

data "azurerm_subnet" "subnet_two" {
  name                 = "subnet2"
  virtual_network_name = var.vnet2
  resource_group_name  = data.azurerm_resource_group.rsi_rg.name
}

data "azurerm_network_security_group" "sg_1" {
  name                = "sg_1"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
}

data "azurerm_network_security_group" "sg_2" {
  name                = "sg_2"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
}

