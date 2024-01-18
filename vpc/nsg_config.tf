// Creates the 1st NSG for VNET1 \\

resource "azurerm_network_security_group" "sg_1" {
  name                = "sg_1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name

}

// Creates the 2nd NSG for VNET2 //
resource "azurerm_network_security_group" "sg_2" {
  name                = "sg_2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name

}

// Rule for NSG1 to allow port 3389 inbound \\
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

// Rule for NSG2 to allow port 22 inbound, this allows us to be able to ssh into the ubuntu vm from the windows server \\
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