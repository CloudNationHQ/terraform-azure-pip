# Complete

This example highlights the complete usage.

## Types

```hcl
config = map(object({
  name                    = string
  location                = string
  resource_group          = string
  zones                   = optional(list(string))
  allocation_method       = optional(string)
  sku                     = optional(string)
  sku_tier                = optional(string)
  ip_version              = optional(string)
  ddos_protection_mode    = optional(string)
  idle_timeout_in_minutes = optional(number)
  domain_name_label       = optional(string)
  ip_tags                 = optional(map(string))
}))
```
