module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

  suffix = ["demo", "pref"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 1.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name
      location = "westeurope"
    }
  }
}

module "public_ip" {
  source  = "cloudnationhq/pip/azure"
  version = "~> 1.0"

  naming = local.naming

  config = {
    name           = module.naming.public_ip.name
    location       = module.rg.groups.demo.location
    resource_group = module.rg.groups.demo.name
    zones          = ["1", "2", "3"]

    prefix = {
      prefix_length = 28
      zones         = ["1", "2", "3"]
    }
  }
}
