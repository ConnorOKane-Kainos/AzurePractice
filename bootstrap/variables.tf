variable "location" {
  type    = string
  default = "uksouth"
}

variable "assigned_identity" {
  type = string
  default = "rsi-identity"
  description = "assigned identity name"
}