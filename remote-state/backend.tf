resource "azurerm_storage_account" "tfstate" {
  name                             = "tfstateoc2222"
  resource_group_name              = var.rg_name
  location                         = var.rg_location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  allow_nested_items_to_be_public  = true

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}