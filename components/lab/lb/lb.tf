// This is my load balacner that sits infront of my two windows vm's \\

resource "azurerm_lb" "lb" {
  name                = var.rsi_lb
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  sku                 = "Standard" // You need to use standard sku

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
  sku                 = "Standard" // You need to use standard sku
}

// Creating a back end address pool - This is where the two VM's in VNET1 will be \\

resource "azurerm_lb_backend_address_pool" "lb_address_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.rsi_lb}-address-pool"
}


// Health Probe for RDP \\
resource "azurerm_lb_probe" "health_probe" {
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "RDP-probe"
  protocol            = "Tcp"
  port                = 3389
  interval_in_seconds = 5
  number_of_probes    = 2
}



// Load Balancer Rule for RDP \\
resource "azurerm_lb_rule" "rdp_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "RDP"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "public-ip-configuration"
  enable_floating_ip             = false
  idle_timeout_in_minutes        = 5
  probe_id                       = azurerm_lb_probe.health_probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_address_pool.id] // Associated with the backend pools \\
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


