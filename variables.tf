variable "configs" {
  description = "Contains configuration for public ip addresses"
  type = map(object({
    name                    = optional(string)
    resource_group_name     = optional(string)
    location                = optional(string)
    allocation_method       = optional(string, "Static")
    sku                     = optional(string, "Standard")
    domain_name_label_scope = optional(string)
    zones                   = optional(list(string))
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string)
    domain_name_label       = optional(string)
    edge_zone               = optional(string)
    idle_timeout_in_minutes = optional(number, 4)
    reverse_fqdn            = optional(string)
    sku_tier                = optional(string, "Regional")
    ip_version              = optional(string, "IPv4")
    ip_tags                 = optional(map(string), {})
    public_ip_prefix_id     = optional(string)
    tags                    = optional(map(string))
  }))

  validation {
    condition = alltrue([
      for k, v in var.configs : (
        v.location != null || var.location != null
      )
    ])
    error_message = "location must be provided either in the config object or as a separate variable."
  }

  validation {
    condition = alltrue([
      for k, v in var.configs : (
        v.resource_group_name != null || var.resource_group_name != null
      )
    ])
    error_message = "resource group name must be provided either in the config object or as a separate variable."
  }
}

variable "naming" {
  description = "contains naming convention"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
