output "configs" {
  description = "contains all public ip prefixes"
  value       = azurerm_public_ip_prefix.prefix
}
