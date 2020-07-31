terraform {
  backend "remote" {
    organization = "Chicago-PowerShell"

    workspaces {
      name = "GHA-Remote-ModuleTest"
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
