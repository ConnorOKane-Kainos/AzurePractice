// This output will give you the private IP you need to use in order to SSH into the ubuntu VM from the windows server \\
// use the command 'ssh adminuser@<enter private ip output here>' and run it once you have RDP'd into the windows server \\

output "private_ip_linux_vm" {
  description = "The private IP address of the Linux VM"
  value       = azurerm_network_interface.nic3.private_ip_address
}