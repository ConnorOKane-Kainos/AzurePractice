// Creating a DNS zone \\

resource "azurerm_dns_zone" "dns_zone" {
  name = "rsi-dns-sandbox.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.rsi_rg.name 
}

// Create a DNS A Record to point to the Load Balancer's Public IP \\
resource "azurerm_dns_a_record" "dns_a_record" {
  name                = "www" // subdomain, for example it will www.example.com
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = data.azurerm_resource_group.rsi_rg.name
  ttl                 = 300
  records = [data.azurerm_public_ip.lb_publicip.ip_address]

}