variable "location" {
  type    = string
  default = "uksouth"
}

variable "security_group" {
  type        = string
  description = "security groups for vnet"
  default = ""
}