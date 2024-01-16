// Creates a rule on the 1st NSG to allow access to traffic via port 22 \\
resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "allow-SSH"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = data.azurerm_network_security_group.sg_1.name
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
}

// Creates a rule on the 1st NSG to allow access to traffic via port 3389 for RDP \\
resource "azurerm_network_security_rule" "rdp_rule" {
  name                        = "allow-RDP"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*" 
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = data.azurerm_network_security_group.sg_1.name
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
}


// Creates a rule on the 2nd NSG to allow access to traffic via port 22 \\
resource "azurerm_network_security_rule" "ssh_rule_vm2" {
  name                        = "allow-SSH"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = data.azurerm_network_security_group.sg_2.name
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
}

// Creates a rule on the 2nd NSG to allow access to traffic via port 3389 for RDP \\
resource "azurerm_network_security_rule" "rdp_rule_vm2" {
  name                        = "allow-RDP"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*" 
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = data.azurerm_network_security_group.sg_2.name
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
}

resource "azurerm_network_security_rule" "allow_ssh_lb" {
  name                        = "allow-SSH-LB"
  priority                    = 1020
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "2200"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = data.azurerm_network_security_group.sg_1.name
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
}

resource "azurerm_network_security_rule" "allow_ssh_lb_vm2" {
  name                        = "allow-SSH-LB"
  priority                    = 1020
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "2200"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = data.azurerm_network_security_group.sg_2.name
  resource_group_name         = data.azurerm_resource_group.rsi_rg.name
}


