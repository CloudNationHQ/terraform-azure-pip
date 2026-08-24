variable "configs" {
  description = "contains all public ip prefix configuration"
  type = map(object({
    name                = optional(string)
    prefix_length       = number
    resource_group_name = optional(string)
    location            = optional(string)
    sku                 = optional(string)
    sku_tier            = optional(string)
    ip_version          = optional(string)
    custom_ip_prefix_id = optional(string)
    zones               = optional(list(string))
    tags                = optional(map(string))
  }))

  validation {
    condition = alltrue([
      for k, v in var.configs : (
        lookup(v, "location", null) != null || var.location != null
      )
    ])
    error_message = "location must be provided either in the config object or as a separate variable."
  }

  validation {
    condition = alltrue([
      for k, v in var.configs : (
        lookup(v, "resource_group_name", null) != null || var.resource_group_name != null
      )
    ])
    error_message = "resource group name must be provided either in the config object or as a separate variable."
  }
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
