provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account to use."
  type        = string
  default     = "bootstrapperstorageacct"
}

variable "container_name" {
  description = "The name of the Blob Storage container."
  type        = string
  default     = "bootstrapper-container"
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "e8e1aa1e-a6f9-46e1-887b-e73ee421128e"
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.bootstrapper.name
  location                 = azurerm_resource_group.bootstrapper.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Name        = "Bootstrapper Storage Account"
    Environment = "Production"
  }
}

resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}

output "bootstrapper_storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "bootstrapper_container_name" {
  value = azurerm_storage_container.this.name
}
