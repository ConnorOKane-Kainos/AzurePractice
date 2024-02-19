# resource "random_string" "storage_account_name" {
#   length  = 8
#   upper   = false
#   special = false
# }

# resource "azurerm_storage_account" "sa" {
#   name                     = random_string.storage_account_name.result
#   resource_group_name      = var.rg
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   depends_on = [ azurerm_resource_group.rsi_rg ]
# }

# resource "azurerm_storage_container" "sc" {
#   name                  = "tfstate"
#   storage_account_name  = azurerm_storage_account.sa.name
#   container_access_type = "private"
#   depends_on = [ azurerm_resource_group.rsi_rg ]
# }