# public ip
resource "azurerm_public_ip" "this" {
  for_each = var.configs

  name = coalesce(
    each.value.name, each.key
  )

  resource_group_name = coalesce(
    each.value.resource_group_name, var.resource_group_name
  )

  location = coalesce(
    each.value.location, var.location
  )

  tags = coalesce(
    each.value.tags, var.tags
  )

  allocation_method       = each.value.allocation_method
  sku                     = each.value.sku
  sku_tier                = each.value.sku_tier
  domain_name_label       = each.value.domain_name_label
  domain_name_label_scope = each.value.domain_name_label_scope
  public_ip_prefix_id     = each.value.public_ip_prefix_id
  zones                   = each.value.zones
  ddos_protection_mode    = each.value.ddos_protection_mode
  ddos_protection_plan_id = each.value.ddos_protection_plan_id
  edge_zone               = each.value.edge_zone
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  reverse_fqdn            = each.value.reverse_fqdn
  ip_version              = each.value.ip_version
  ip_tags                 = each.value.ip_tags
}
