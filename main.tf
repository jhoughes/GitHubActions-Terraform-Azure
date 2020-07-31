terraform {
  backend "remote" {
    organization = "Chicago-PowerShell"

    workspaces {
      name = "atxopenshift-workshop101"
    }
  }
}

resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
    value = var.prefix      #Cheating to load variable without errors
    value = var.environment #Cheating to load variable without errors
  }
}
