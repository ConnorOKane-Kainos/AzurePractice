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
