output "configs" {
  description = "configuration for public ip's"
  value       = azurerm_public_ip.public
}

output "prefix" {
  description = "Map of public IP prefixes"
  value = {
    for k, v in azurerm_public_ip_prefix.prefix : k => v.id
  }
}
