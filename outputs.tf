output "config" {
  description = "configuration for public ip's"
  value       = azurerm_public_ip.public
}

output "prefix" {
  description = "configuration for public ip prefix"
  value       = azurerm_public_ip_prefix.prefix
}
