# Output for the Public IP Address of VM1
output "vm_public_ip" {
  value       = azurerm_public_ip.publicip1.ip_address
  description = "The Public IP Address of the VM1"
}

# Output for the Public IP Address of VM1
output "vm2_public_ip" {
  value       = azurerm_public_ip.publicip2.ip_address
  description = "The Public IP Address of the VM2"
}

# output "network_interface_id1" {
#   value       = azurerm_network_interface.nic1
#   description = "The network ID Address of the NIF1"
# }

# output "network_interface_id2" {
#   value       = azurerm_network_interface.nic2
#   description = "The network ID Address of the NIF2"
# }