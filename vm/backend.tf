terraform {
  backend "azurerm" {
    resource_group_name   = "rsi_rg"
    storage_account_name  = "stg8p7dskf"
    container_name        = "tfstate"
    key                   = "vm.terraform.tfstate"
  }
}
