terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.2.0"  # Specify the version you want to use
    }
  }
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/windsor-bootstrapper"
  personal_access_token = var.azure_devops_pat  # Ensure you have this variable set
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

resource "azurerm_resource_group" "bootstrapper" {
  name     = "bootstrapper-resources"
  location = "East US"
}

resource "azuredevops_project" "bootstrapper" {
  name               = "WindsorBootstrapper"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "bootstrapper" {
  project_id = azuredevops_project.bootstrapper.id
  name       = "WindsorBootstrapper"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_variable_group" "bootstrapper" {
  project_id   = azuredevops_project.bootstrapper.id
  name         = "Example Pipeline Variables"
  description  = "Managed by Terraform"
  allow_access = true

  variable {
    name  = "FOO"
    value = "BAR"
  }
}

resource "azuredevops_build_definition" "bootstrapper" {
  project_id = azuredevops_project.bootstrapper.id
  name       = "WindsorBootstrapper Build Definition"

  repository {
    repo_type             = "Git"
    repo_id               = azuredevops_git_repository.bootstrapper.id
    branch_name           = "main"  # Replace with the actual branch name if different
    yml_path              = "azure/azure-pipelines.yml"
    service_connection_id = azuredevops_serviceendpoint_azurerm.bootstrapper.id
  }

  ci_trigger {
    use_yaml = true
  }
}

resource "azuredevops_serviceendpoint_azurerm" "bootstrapper" {
  project_id            = azuredevops_project.bootstrapper.id
  service_endpoint_name = "Bootstrapper AzureRM Service Connection"
  description           = "Service connection to Azure for Windsor Bootstrapper"
  credentials {
    serviceprincipalid  = var.azure_devops_pat
    serviceprincipalkey = var.azure_subscription_id
  }
  azurerm_spn_tenantid  = "dd9a39ee-95fd-4511-9493-f8a58aca7970"
  azurerm_subscription_id = var.azure_subscription_id
  azurerm_subscription_name = "Azure subscription 1"
}

variable "azure_devops_pat" {
  description = "Personal Access Token for Azure DevOps"
  type        = string
  sensitive   = true
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}   
