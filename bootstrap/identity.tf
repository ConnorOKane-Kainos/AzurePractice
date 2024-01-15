resource "azurerm_user_assigned_identity" "assigned_identity" {
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  location            = var.location
  name                = var.assigned_identity
}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = data.azurerm_resource_group.rsi_rg.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.assigned_identity.principal_id
}
