resource "azurerm_network_security_group" "sg_1" {
  name                = "sg_1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  depends_on          = [data.azurerm_resource_group.rsi_rg]
}

resource "azurerm_network_security_group" "sg_2" {
  name                = "sg_2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  depends_on          = [data.azurerm_resource_group.rsi_rg]
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
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "10.1.0.0/24"
  destination_address_prefix  = "10.2.0.0/24"
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
  network_security_group_name = data.azurerm_network_security_group.sg_2.name
}