# public ip
resource "azurerm_public_ip" "public" {
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
      join("-", [var.naming.public_ip, each.key]), null
    ), each.key
  )

  allocation_method       = each.value.allocation_method
  sku                     = each.value.sku
  domain_name_label_scope = each.value.domain_name_label_scope
  public_ip_prefix_id     = each.value.public_ip_prefix_id
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

  tags = coalesce(
    each.value.tags, var.tags
  )
}
