// This is the public IP of the load balancer, you will need this to RDP into your windows server followed by the port 3389 that we are hitting \\

output "public_ip_address" {
  value = azurerm_public_ip.lb_publicip.ip_address
}
