// This is my load balacner that sits infront of my two windows vm's \\

resource "azurerm_lb" "lb" {
  name                = var.rsi_lb
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name

  frontend_ip_configuration {
    name                 = "public-ip-configuration"
    public_ip_address_id = azurerm_public_ip.lb_publicip.id
  }
}

// Create a Public IP address for the load balancer \\
resource "azurerm_public_ip" "lb_publicip" {
  name                = "${var.rsi_lb}-pubIP"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  allocation_method   = "Static"
  sku                 = "Basic"
}

// Creating a back end address pool - This is where the two VM's in VNET1 will be connected \\

resource "azurerm_lb_backend_address_pool" "lb_address_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.rsi_lb}-address-pool"
}

// This health probe below will help to ensure the VM's are running as expected  \\

resource "azurerm_lb_probe" "lb_proe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.rsi_lb}-probe"
  protocol        = "Http"
  request_path    = "/"
  port            = 80
}


// Here we will now define our load balancing rules \\

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "${var.rsi_lb}-rules"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "public-ip-configuration"
  probe_id                       = azurerm_lb_probe.lb_proe.id
}

// Associating the VM's network interafce with the backend address pools \\
resource "azurerm_network_interface_backend_address_pool_association" "vm1_backend_address_pool" {
  network_interface_id    = data.azurerm_network_interface.nic1.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_address_pool.id
}

// Associating the 2nd VM's network interafce with the backend address pools \\
resource "azurerm_network_interface_backend_address_pool_association" "vm2_backend_address_pool" {
  network_interface_id    = data.azurerm_network_interface.nic2.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_address_pool.id
}


