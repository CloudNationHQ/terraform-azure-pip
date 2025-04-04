resource "azurerm_public_ip_prefix" "prefix" {
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


  name          = each.value.name
  prefix_length = each.value.prefix_length
  sku           = each.value.sku
  sku_tier      = each.value.sku_tier
  ip_version    = each.value.ip_version
  zones         = each.value.zones

  tags = try(
    each.value.tags, var.tags, null
  )
}
