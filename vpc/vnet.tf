resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  address_space       = ["10.0.0.0/16"]
  depends_on          = [data.azurerm_resource_group.rsi_rg]
  #   dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.sg_1.id
  }
}

resource "azurerm_network_security_group" "sg_1" {
  name                = "sg_1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  depends_on          = [data.azurerm_resource_group.rsi_rg]
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet-2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  address_space       = ["10.1.0.0/16"]
  depends_on          = [data.azurerm_resource_group.rsi_rg]
  #   dns_servers         = ["10.0.0.6", "10.0.0.7"]

  subnet {
    name           = "subnet2"
    address_prefix = "10.1.0.0/16"
    security_group = azurerm_network_security_group.sg_2.id
  }

}

resource "azurerm_network_security_group" "sg_2" {
  name                = "sg_2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  depends_on          = [data.azurerm_resource_group.rsi_rg]
}

# Peering from VNet1 to VNet2
resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                      = "peer-vnet1-to-vnet2"
  resource_group_name       = data.azurerm_resource_group.rsi_rg.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
  depends_on                = [data.azurerm_resource_group.rsi_rg]

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

# Peering from VNet2 to VNet1
resource "azurerm_virtual_network_peering" "vnet2_to_vnet1" {
  name                      = "peer-vnet2-to-vnet1"
  resource_group_name       = data.azurerm_resource_group.rsi_rg.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
  depends_on                = [data.azurerm_resource_group.rsi_rg]

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

