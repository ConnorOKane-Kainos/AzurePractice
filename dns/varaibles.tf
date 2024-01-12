variable "vnet1" {
  type        = string
  description = "name of vnet 1"
  default     = "vnet-1"
}

variable "rsi_lb" {
  type    = string
  default = "rsi_lb-pubIP"
}