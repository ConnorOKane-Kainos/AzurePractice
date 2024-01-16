variable "location" {
  type    = string
  default = "uksouth"
}

variable "rsi_lb" {
  type    = string
  default = "rsi_lb"
}

variable "my_NIC" {
  type    = string
  default = "my_NIC"
}

# variable "network_interface_ids" {
#   description = "List of network interface IDs to associate with the NAT rule"
#   type        = list(string)
#   default     = ["azurerm_network_interface.nic1.id", "azurerm_network_interface.nic2.id"] # Replace with actual Network Interface IDs
# }