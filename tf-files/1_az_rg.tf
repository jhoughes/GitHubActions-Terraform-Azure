#Section 1 - Azure RM Resource Group

provider "azurerm" {
  version         = "2.20.0"
  subscription_id = var.subscription
  client_id       = var.client_Id
  client_secret   = var.client_Secret
  tenant_id       = var.tenant_Id
  features {
    #The features block supports the following:
    #key_vault - (Optional) A key_vault block as defined below.
    #virtual_machine - (Optional) A virtual_machine block as defined below.
    #virtual_machine_scale_set - (Optional) A virtual_machine_scale_set block as defined below.

    #Since I'm not using any of these, this required argument is blank, other than the comments.
  }
}

resource "azurerm_resource_group" "DemoRG" {
  name     = "PowerShellChicago_FullStackGeek"
  location = var.location

  tags = {
    environment = var.environment
  }
}