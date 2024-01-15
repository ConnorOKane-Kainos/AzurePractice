# resource "azurerm_user_assigned_identity" "assigned_identity" {
#   resource_group_name = data.azurerm_resource_group.rsi_rg.name
#   location            = var.location
#   name                = "example-msi"
# }

# resource "azurerm_role_assignment" "role_assignment" {
#   scope                = var.subscription # Can be a subscription, resource group, or specific resource
#   role_definition_name = "Contributor"  # The name of the built-in role
#   principal_id         = azurerm_user_assigned_identity.assigned_identity.id
# }