variable "location" {
  type    = string
  default = "uksouth"
}

variable "vnet1" {
  type        = string
  description = "name of vnet 1"
  default     = "vnet-1"
}

variable "vnet2" {
  type        = string
  description = "name of vnet 2"
  default     = "vnet-2"
}

variable "linux_vm" {
  type = string
  description = "name of linux vm"
  default = "linuxvm"
}
