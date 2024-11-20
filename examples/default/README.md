# Default

This example illustrates the default setup, in its simplest form.

## Types

```hcl
config = map(object({
  name           = string
  location       = string
  resource_group = string
  zones          = optional(list(string))
}))
```
