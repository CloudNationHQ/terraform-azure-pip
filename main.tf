# public ip
resource "azurerm_public_ip" "public" {
  for_each = var.configs

  resource_group_name = coalesce(
    lookup(
      each.value, "resource_group", null
    ), var.resource_group
  )

  location = coalesce(
    lookup(each.value, "location", null
    ), var.location
  )


  name                    = each.value.name
  allocation_method       = each.value.allocation_method
  sku                     = each.value.sku
  domain_name_label_scope = each.value.domain_name_label_scope
  public_ip_prefix_id     = lookup(each.value, "prefix", null) != null ? azurerm_public_ip_prefix.prefix[each.key].id : null
  zones                   = each.value.zones
  ddos_protection_mode    = each.value.ddos_protection_mode
  ddos_protection_plan_id = each.value.ddos_protection_plan_id
  domain_name_label       = each.value.domain_name_label
  edge_zone               = each.value.edge_zone
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  reverse_fqdn            = each.value.reverse_fqdn
  sku_tier                = each.value.sku_tier
  ip_version              = each.value.ip_version
  ip_tags                 = each.value.ip_tags

  tags = try(
    var.tags, {}
  )
}

resource "azurerm_public_ip_prefix" "prefix" {
  for_each = {
    for k, v in var.configs : k => v.prefix
    if lookup(v, "prefix", null) != null
  }

  name = coalesce(
    lookup(each.value, "name", null
    ), join("-", [var.naming.public_ip_prefix, each.key])
  )

  resource_group_name = coalesce(
    lookup(
      each.value, "resource_group", null
    ), var.resource_group
  )

  location = coalesce(
    lookup(
      each.value, "location", null
    ), var.location
  )

  prefix_length = each.value.prefix_length
  sku           = each.value.sku
  sku_tier      = each.value.sku_tier
  ip_version    = each.value.ip_version

  zones = try(
    each.value.zones, var.configs[each.key].zones
  )

  tags = try(
    var.tags, {}
  )
}
