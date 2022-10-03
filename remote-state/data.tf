data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

output "backend_tfstate_name" {
  value = azurerm_storage_account.tfstate.name
}