variable "subscription" {
  type = string
}

variable "client_Id" {
  description = "Your Azure service primcipal client ID"

  type = string
}

variable "client_Secret" {
  description = "Your Azure service principal client secret -- this will be pulled from a GitHub Secret"
  type        = string
}

variable "tenant_Id" {
  description = "Your Azure subscription tenant ID"
  type        = string
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created"
  type        = string
}
