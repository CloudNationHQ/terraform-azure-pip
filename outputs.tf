output "public_ips" {
  description = "contains all public ip addresses"
  value       = azurerm_public_ip.this
}
