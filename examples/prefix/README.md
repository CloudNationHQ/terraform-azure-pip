# Prefix

This deploys an IP prefix associated with the public ip.

## Types

```hcl
config = object({
  name           = string
  location       = string
  resource_group = string
  zones          = optional(list(string))
  prefix         = optional(object({
    prefix_length = optional(number)
    zones         = optional(list(string))
  }))
})
```

## Notes

Public ip prefix can only be created with the standard sku at this time.

Public ip addresses per subscription have default limits, which can be increased through a support request if necessary.
