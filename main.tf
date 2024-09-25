# public ip
resource "azurerm_public_ip" "public" {
  for_each = var.configs

  name                = each.value.name
  resource_group_name = coalesce(lookup(each.value, "resource_group", null), var.resource_group)
  location            = coalesce(lookup(each.value, "location", null), var.location)
  allocation_method   = try(each.value.allocation_method, "Static")
  sku                 = try(each.value.sku, "Standard")
  public_ip_prefix_id = lookup(each.value, "prefix", null) != null ? azurerm_public_ip_prefix.prefix[each.key].id : null
  zones               = try(each.value.zones, null)
  ddos_protection_mode = try(each.value.ddos_protection_mode, "VirtualNetworkInherited")
  ddos_protection_plan_id = try(each.value.ddos_protection_plan_id, null)
  domain_name_label = try(each.value.domain_name_label, null)
  edge_zone = try(each.value.edge_zone, null)
  idle_timeout_in_minutes = try(each.value.idle_timeout_in_minutes, null)
  reverse_fqdn = try(each.value.reverse_fqdn, null)
  sku_tier            = try(each.value.sku_tier, "Regional")
  ip_version          = try(each.value.ip_version, "IPv4")
  tags                = try(var.tags, {})
}

resource "azurerm_public_ip_prefix" "prefix" {
  for_each = {
    for k, v in var.configs : k => v.prefix
    if lookup(v, "prefix", null) != null
  }

  name                = try(each.value.name, join("-", [var.naming.public_ip_prefix, each.key]))
  resource_group_name = coalesce(lookup(each.value, "resource_group", null), var.resource_group)
  location            = coalesce(lookup(each.value, "location", null), var.location)
  prefix_length       = each.value.prefix_length
  sku                 = try(each.value.sku, "Standard")
  ip_version          = try(each.value.ip_version, "IPv4")
  zones               = try(each.value.zones, var.configs[each.key].zones)
  tags                = try(var.tags, {})
}
