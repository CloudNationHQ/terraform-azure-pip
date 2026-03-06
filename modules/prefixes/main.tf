resource "azurerm_public_ip_prefix" "prefix" {
  for_each = var.configs

  resource_group_name = coalesce(
    lookup(
      each.value, "resource_group_name", null
    ), var.resource_group_name
  )

  location = coalesce(
    lookup(each.value, "location", null
    ), var.location
  )

  name = coalesce(
    each.value.name, try(
      join("-", [var.naming.public_ip_prefix, each.key]), null
    ), each.key
  )

  prefix_length       = each.value.prefix_length
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier
  ip_version          = each.value.ip_version
  custom_ip_prefix_id = each.value.custom_ip_prefix_id
  zones               = each.value.zones

  tags = coalesce(
    each.value.tags, var.tags
  )
}
