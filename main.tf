

# Resource Group
resource "azurerm_resource_group" "ranjeet-rg" {
  name     = "ranjeet-rg-demo"
  location = "Central India"
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "ranjeet-demo-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "ranjeet-demo-subnet"
  resource_group_name  = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# NIC
resource "azurerm_network_interface" "nic" {
  name                = "ranjeet-demo-nic"
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "ranjeet-demo-vm"
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  location            = azurerm_resource_group.ranjeet-rg.location
  size                = "Standard_B1s"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_password                  = "Password@12345"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}