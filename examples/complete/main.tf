module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.22"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 2.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}

module "public_ip" {
  source  = "cloudnationhq/pip/azure"
  version = "~> 2.0"

  configs = {
    pub = {
      name                    = module.naming.public_ip.name
      location                = module.rg.groups.demo.location
      resource_group          = module.rg.groups.demo.name
      zones                   = ["1", "2", "3"]
      allocation_method       = "Static"
      sku                     = "Standard"
      sku_tier                = "Regional"
      ip_version              = "IPv4"
      ddos_protection_mode    = "VirtualNetworkInherited"
      idle_timeout_in_minutes = 4

      domain_name_label = "webapp-prod-eastus2-001"
    }
  }
}
