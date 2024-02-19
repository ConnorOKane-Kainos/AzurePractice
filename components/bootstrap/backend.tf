# terraform {
#   backend "azurerm" {
#     resource_group_name   = "rsi_rg"
#     storage_account_name  = "enter_generated_name"
#     container_name        = "tfstate"
#     key                   = "bootstrap.terraform.tfstate"
#   }
# }