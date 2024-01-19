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
  type        = string
  description = "name of linux vm"
  default     = "linuxvm"
}
variable "availability_set" {
  type        = string
  description = "Availability set for the two VM's in VNET1"
  default     = "vm-availability-set"
}
variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
}

variable "windows_vm_admin_password" {
  description = "Admin password for the Windows VMs"
  type        = string

}

variable "linux_vm_admin_password" {
  description = "Admin password for the Linux VM"
  type        = string
}
