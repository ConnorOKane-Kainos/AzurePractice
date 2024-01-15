terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.67.0"
    }
  }
}
provider "azurerm" {
  features {}
  # use_msi = true
  # subscription_id = var.subscription
}
data "azurerm_client_config" "current" {}