terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "terraformgithubactions02"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    #use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  #use_oidc = true
}

resource "azurerm_storage_account" "yogesh_test_storage_account" {
  name                     = "yogeshteststorageaccount"
  resource_group_name      = "rg-terraform-github-actions-state"
  location                 = "South India"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
#Just adding a line here
#Test Comment1
