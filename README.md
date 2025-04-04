# Public Ip

This terraform module automates the provisioning and management of public ip addresses in azure, offering customizable configurations for allocation and association with resources.

## Features

Supports configuring prefixes.

Utilization of terratest for robust validation.

Supports multiple public ip addresses

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

- [azurerm_public_ip.public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_configs"></a> [configs](#input\_configs)

Description: Contains configuration for public ip addresses

Type:

```hcl
map(object({
    name                    = string
    resource_group          = optional(string, null)
    location                = optional(string, null)
    allocation_method       = optional(string, "Static")
    sku                     = optional(string, "Standard")
    domain_name_label_scope = optional(string, null)
    zones                   = optional(list(string), null)
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string, null)
    domain_name_label       = optional(string, null)
    edge_zone               = optional(string, null)
    idle_timeout_in_minutes = optional(number, null)
    reverse_fqdn            = optional(string, null)
    sku_tier                = optional(string, "Regional")
    ip_version              = optional(string, "IPv4")
    ip_tags                 = optional(map(string), {})
    public_ip_prefix_id     = optional(string, null)
    tags                    = optional(map(string))
  }))
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: default azure region to be used.

Type: `string`

Default: `null`

### <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group)

Description: default resource group to be used.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_configs"></a> [configs](#output\_configs)

Description: contains all public ip addresses
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md). <br><br>

<a href="https://github.com/cloudnationhq/terraform-azure-pip/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudnationhq/terraform-azure-pip" />
</a>

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/public-ip-addresses)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/virtualnetwork/public-ip-addresses)
