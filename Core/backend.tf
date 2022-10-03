terraform {
  backend "azurerm" {
    resource_group_name  = var.rg_name
    storage_account_name = "tfstaterl4cf"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}