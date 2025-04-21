terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.2.0"  # Specify the version you want to use
    }
  }
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/tvangundy"
  personal_access_token = var.azure_devops_pat  # Ensure you have this variable set
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azuredevops_project" "example" {
  name               = "Example Project"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Managed by Terraform"
  features = {
    testplans = "disabled"
    artifacts = "disabled"
  }
}

variable "azure_devops_pat" {
  description = "Personal Access Token for Azure DevOps"
  type        = string
  sensitive   = true
}
   