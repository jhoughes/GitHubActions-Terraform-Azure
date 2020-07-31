#Section 2 - Virtual network, subnet, public IP

# Create Vnet
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet-${var.environment}"
  resource_group_name = azurerm_resource_group.DemoRG.name
  location            = azurerm_resource_group.DemoRG.location
  address_space       = [var.address_space]
}

#Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-subnet-${var.environment}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.DemoRG.name
  address_prefixes     = [var.address_prefix]
}

# Create Dynamic Public IP Address
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.prefix}-public-ip-${var.environment}"
  resource_group_name = azurerm_resource_group.DemoRG.name
  location            = var.location
  allocation_method   = "Dynamic"
}