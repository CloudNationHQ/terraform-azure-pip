variable "configs" {
  description = "Contains configuration for public ip prefixes"
  type = map(object({
    name           = string
    prefix_length  = number
    resource_group = optional(string)
    location       = optional(string)
    sku            = optional(string, "Standard")
    sku_tier       = optional(string, "Regional")
    ip_version     = optional(string, "IPv4")
    zones          = optional(list(string))
    tags           = optional(map(string))
  }))
}

variable "resource_group" {
  description = "default resource group and can be used if resourcegroup is not specified inside the object."
  type        = string
  default     = null
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
