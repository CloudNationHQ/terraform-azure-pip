variable "configs" {
  description = "Contains configuration for public ip addresses"
  type = map(object({
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
    # prefix = optional(object({
    #   name           = optional(string)
    #   prefix_length  = number
    #   resource_group = optional(string, null)
    #   location       = optional(string, null)
    #   sku            = optional(string, "Standard")
    #   sku_tier       = optional(string, "Regional")
    #   ip_version     = optional(string, "IPv4")
    #   zones          = optional(list(string), null)
    # }), null)
  }))
}

variable "naming" {
  description = "used for naming purposes"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
