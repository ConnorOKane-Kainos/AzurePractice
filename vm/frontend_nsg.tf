# resource "azurerm_network_security_rule" "allow_ssh_outbound" {
#   name                        = "allowSshOutbound"
#   priority                    = 100
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "22"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "VirtualNetwork"
#   resource_group_name         = data.azurerm_resource_group.rsi_rg.name
#   network_security_group_name = azurerm_network_security_group.frontend_nsg.name
# }

# // Ubuntu VM network security group

# # resource "azurerm_network_security_group" "frontend_nsg" {
# #   name                = "FrontendNSG"
# #   location            = var.location
# #   resource_group_name = data.azurerm_resource_group.rsi_rg.name
# # }

# // Allows SSH ibound for port 22
# resource "azurerm_network_security_rule" "allow_ssh_inbound" {
#   name                        = "allowSshInbound"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "22"
#   source_address_prefix       = "VirtualNetwork"
#   destination_address_prefix  = "*"
#   resource_group_name         = data.azurerm_resource_group.rsi_rg.name
#   network_security_group_name = azurerm_network_security_group.backend_nsg.name
# }

# // Network security group for backend config
# resource "azurerm_network_security_group" "backend_nsg" {
#   name                = "BackendNSG"
#   location            = var.location
#   resource_group_name = data.azurerm_resource_group.rsi_rg.name
# }


