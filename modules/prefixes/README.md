# Ip Prefixes

This submodule illustrates how to manage public ip prefixes

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 4.0)

## Resources

The following resources are used by this module:

- [azurerm_public_ip_prefix.prefix](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip_prefix) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_configs"></a> [configs](#input\_configs)

Description: Contains configuration for public ip prefixes

Type:

```hcl
map(object({
    name                = optional(string)
    prefix_length       = number
    resource_group_name = optional(string)
    location            = optional(string)
    sku                 = optional(string, "Standard")
    sku_tier            = optional(string, "Regional")
    ip_version          = optional(string, "IPv4")
    zones               = optional(list(string))
    tags                = optional(map(string))
  }))
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: default azure region to be used.

Type: `string`

Default: `null`

### <a name="input_naming"></a> [naming](#input\_naming)

Description: contains naming convention

Type: `map(string)`

Default: `{}`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: default resource group and can be used if resourcegroup is not specified inside the object.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_configs"></a> [configs](#output\_configs)

Description: contains all public ip prefixes
<!-- END_TF_DOCS -->
