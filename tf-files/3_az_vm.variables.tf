#Section 4 - Virtual machines

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  type        = string
}

variable "image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  type        = string
}

variable "image_offer" {
  description = "Name of the offer (az vm image list)"
  type        = string
}

variable "image_sku" {
  description = "Image SKU to apply (az vm image list)"
  type        = string
}

variable "image_version" {
  description = "Version of the image to apply (az vm image list)"
  type        = string
}

variable "admin_username" {
  description = "Administrator user name for Windows VM"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for Windows VM"
  type        = string
}

