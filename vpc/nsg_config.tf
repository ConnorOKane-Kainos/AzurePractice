resource "azurerm_network_security_group" "sg_1" {
  name                = "sg_1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  # depends_on          = [data.azurerm_resource_groups.vnet1]
}

resource "azurerm_network_security_group" "sg_2" {
  name                = "sg_2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  # depends_on          = [data.azurerm_resource_group.vnet2]
}

resource "azurerm_network_security_rule" "allow_rdp" {
  name                        = "allow-rdp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
  network_security_group_name = data.azurerm_network_security_group.sg_1.name
  depends_on = [ azurerm_network_security_group.sg_1 ]
}

resource "azurerm_network_security_rule" "allow_rdp_vm2" {
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "10.0.0.0/16"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
  network_security_group_name = data.azurerm_network_security_group.sg_2.name
  depends_on = [ azurerm_network_security_group.sg_2 ]
}