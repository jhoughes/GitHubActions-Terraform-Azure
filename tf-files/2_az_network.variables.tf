#Section 2 - Virtual network, subnet, public IP

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  type        = string
}

variable "address_prefix" {
  description = "The address prefix to use for the subnet"
  type        = string
}
