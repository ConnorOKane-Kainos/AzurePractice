data "azurerm_resource_group" "rsi_rg" {
  name = "rsi_rg"
}

data "azurerm_public_ip" "lb_publicip" {
  name                = var.rsi_lb
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
}