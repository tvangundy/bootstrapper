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

resource "azuredevops_variable_group" "bootstrapper" {
  project_id   = azuredevops_project.bootstrapper.id
  name         = "Example Pipeline Variables"
  description  = "Managed by Terraform"
  allow_access = true

  variable {
    name  = "TF_VAR_azure_subscription_id"
    value = var.azure_subscription_id
  }
}

resource "azuredevops_build_definition" "bootstrapper" {
  project_id = azuredevops_project.bootstrapper.id
  name       = "WindsorBootstrapper Build Definition"

  repository {
    repo_type             = "GitHub"
    repo_id               = "tvangundy/bootstrapper"  # GitHub repository
    branch_name           = "main"  # Replace with the actual branch name if different
    yml_path              = "/azure/azure-pipelines.yml"
    service_connection_id = azuredevops_serviceendpoint_github.bootstrapper.id
  }

  ci_trigger {
    use_yaml = true
  }
}

resource "azuredevops_serviceendpoint_azurerm" "bootstrapper" {
  project_id            = azuredevops_project.bootstrapper.id
  service_endpoint_name = "WindsorBootstrapperAzureRM"
  description           = "Service connection to Azure for Windsor Bootstrapper"
  credentials {
    serviceprincipalid  = var.service_principal_id
    serviceprincipalkey = var.service_principal_key
  }
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.azure_subscription_id
  azurerm_subscription_name = "Azure subscription 1"
}

resource "azuredevops_serviceendpoint_github" "bootstrapper" {
  project_id            = azuredevops_project.bootstrapper.id
  service_endpoint_name = "Bootstrapper GitHub Service Connection"
  description           = "Service connection to GitHub for Windsor Bootstrapper"

  auth_personal {
    personal_access_token = var.github_pat
  }  
}

variable "azure_devops_pat" {
  description = "Personal Access Token for Azure DevOps"
  type        = string
  sensitive   = true
}

variable "service_principal_id" {
  description = "Service Principal ID (AppId)"
  type        = string
}

variable "service_principal_key" {
  description = "Service Principal Key (Password)"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "github_pat" {
  description = "Personal Access Token for GitHub"
  type        = string
  sensitive   = true
}   
