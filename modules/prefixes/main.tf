# public ip prefix
resource "azurerm_public_ip_prefix" "this" {
  for_each = var.public_ip_prefixes

  name                = coalesce(each.value.name, each.key)
  resource_group_name = coalesce(each.value.resource_group_name, var.resource_group_name)
  location            = coalesce(each.value.location, var.location)

  prefix_length       = each.value.prefix_length
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier
  ip_version          = each.value.ip_version
  custom_ip_prefix_id = each.value.custom_ip_prefix_id
  zones               = each.value.zones

  tags = coalesce(each.value.tags, var.tags)
}
