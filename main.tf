# public ip
resource "azurerm_public_ip" "public" {
  name                    = try(var.config.name, var.naming.public_ip)
  resource_group_name     = coalesce(lookup(var.config, "resource_group", null), var.resource_group)
  location                = coalesce(lookup(var.config, "location", null), var.location)
  allocation_method       = try(var.config.allocation_method, "Static")
  sku                     = try(var.config.sku, "Standard")
  public_ip_prefix_id     = lookup(var.config, "prefix", null) != null ? azurerm_public_ip_prefix.prefix["prefix"].id : null
  zones                   = try(var.config.zones, null)
  sku_tier                = try(var.config.sku_tier, "Regional")
  edge_zone               = try(var.config.edge_zone, null)
  ip_version              = try(var.config.ip_version, "IPv4")
  reverse_fqdn            = try(var.config.reverse_fqdn, null)
  domain_name_label       = try(var.config.domain_name_label, null)
  ddos_protection_mode    = try(var.config.ddos_protection_mode, "VirtualNetworkInherited")
  ddos_protection_plan_id = try(var.config.ddos_protection_plan_id, null)
  idle_timeout_in_minutes = try(var.config.idle_timeout_in_minutes, null)
  ip_tags                 = try(var.config.ip_tags, null)
  tags                    = try(var.config.tags, var.tags, null)
}

# prefix
resource "azurerm_public_ip_prefix" "prefix" {
  for_each = lookup(
    var.config, "prefix", null
  ) != null ? { prefix = var.config.prefix } : {}

  name                = try(var.config.prefix.name, var.naming.public_ip_prefix)
  resource_group_name = coalesce(lookup(each.value, "resource_group", null), var.config.resource_group, var.resource_group)
  location            = coalesce(lookup(each.value, "location", null), var.config.location, var.location)
  prefix_length       = each.value.prefix_length
  sku                 = try(var.config.prefix.sku, "Standard")
  ip_version          = try(var.config.prefix.ip_version, "IPv4")
  zones               = try(var.config.prefix.zones, null)
  tags                = try(var.config.prefix.tags, var.tags, null)
}
