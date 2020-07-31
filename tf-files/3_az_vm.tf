#Section 3 - Virtual machines

resource "azurerm_availability_set" "avail_set" {
  name                         = "${var.prefix}-avail-set-${var.environment}"
  resource_group_name          = azurerm_resource_group.DemoRG.name
  location                     = var.location
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "2"
}


resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic-${var.environment}"
  resource_group_name = azurerm_resource_group.DemoRG.name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "virtual_machine" {
  name                = "${var.prefix}-vm"
  resource_group_name = azurerm_resource_group.DemoRG.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  availability_set_id = azurerm_availability_set.avail_set.id
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}