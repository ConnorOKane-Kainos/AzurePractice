# resource "azurerm_lb_nat_rule" "nat_rule1" {
#   name                           = "Rule-VM1" // Changed to a unique name
#   resource_group_name            = data.azurerm_resource_group.rsi_rg.name
#   loadbalancer_id                = azurerm_lb.lb.id
#   protocol                       = "Tcp"
#   frontend_port                  = 55001
#   backend_port                   = 3389
#   frontend_ip_configuration_name = "public-ip-configuration"
# }

# resource "azurerm_lb_nat_rule" "nat_rule2" {
#   name                           = "Rule-VM2" // Changed to a unique name
#   resource_group_name            = data.azurerm_resource_group.rsi_rg.name
#   loadbalancer_id                = azurerm_lb.lb.id
#   protocol                       = "Tcp"
#   frontend_port                  = 55002
#    backend_port                   = 3389
#   frontend_ip_configuration_name = "public-ip-configuration"
# }

# locals {
#   network_interface_ids = [data.azurerm_network_interface.nic1.id, data.azurerm_network_interface.nic2.id]
# }

# resource "azurerm_network_interface_nat_rule_association" "association1" {
#   nat_rule_id          = azurerm_lb_nat_rule.nat_rule1.id
#   network_interface_id = data.azurerm_network_interface.nic1.id
#   ip_configuration_name = "internal"
# }

# resource "azurerm_network_interface_nat_rule_association" "association2" {
#   nat_rule_id          = azurerm_lb_nat_rule.nat_rule2.id
#   network_interface_id = data.azurerm_network_interface.nic2.id
#   ip_configuration_name = "internal"
# }


