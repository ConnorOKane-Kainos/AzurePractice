// Creates a network interface for VM1 \\
resource "azurerm_network_interface" "nic1" {
  name                = "myNIC1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_one.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip1.id
  }
}

// Associate NSG with the Network Interface
resource "azurerm_network_interface_security_group_association" "nsg_association_nic1" {
  network_interface_id      = azurerm_network_interface.nic1.id
  network_security_group_id = data.azurerm_network_security_group.sg_1.id
}

// Create a Public IP resource
resource "azurerm_public_ip" "publicip1" {
  name                = "myPublicIP1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  allocation_method   = "Dynamic" # Or "Static"
  sku                 = "Basic"
}


// VM 1 to be created and attached to netowrk interface 1 \\
resource "azurerm_windows_virtual_machine" "vm1" {
  name                = "myVM1"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "Password1234!"
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}


// Creates a network interface for VM2 \\
resource "azurerm_network_interface" "nic2" {
  name                = "myNIC2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_one.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip2.id
  }
}

# Create a Public IP resource
resource "azurerm_public_ip" "publicip2" {
  name                = "myPublicIP2"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  allocation_method   = "Dynamic" # Or "Static"
  sku                 = "Basic"
}


// VM 2 to be created and attached to netowrk interface 2 \\
resource "azurerm_windows_virtual_machine" "vm2" {
  name                = "myVM2"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "Password1234!"
  network_interface_ids = [
    azurerm_network_interface.nic2.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

// Associate NSG with the Network Interface
resource "azurerm_network_interface_security_group_association" "nsg_association_nic2" {
  network_interface_id      = azurerm_network_interface.nic2.id
  network_security_group_id = data.azurerm_network_security_group.sg_2.id
}


// Network Interface for Linux VM \\

resource "azurerm_network_interface" "nic3" {
  name                = "nic3"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_two.id
    private_ip_address_allocation = "Dynamic"
  }
}

// Ubuntu VM \\

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                            = var.linux_vm
  resource_group_name             = data.azurerm_resource_group.rsi_rg.name
  location                        = var.location
  size                            = "Standard_B1ls" // This is one of the most cost-effective VM sizes
  admin_username                  = "adminuser"
  admin_password                  = "Password123!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic3.id,
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}



