output "subnet1_id" {
  value       = azurerm_virtual_network.vnet1.subnet.*.id[0]
  description = "The ID of subnet2"
}


output "subnet2_id" {
  value       = azurerm_virtual_network.vnet2.subnet.*.id[0]
  description = "The ID of subnet2"
}
