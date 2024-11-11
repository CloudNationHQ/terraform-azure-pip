module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

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

  naming = local.naming

  resource_group = module.rg.groups.demo.name
  location       = module.rg.groups.demo.location

  configs = {
    pub = {
      name  = module.naming.public_ip.name
      zones = ["1", "2", "3"]
      prefix = {
        prefix_length = 31 # 2 ip's
      }
    }
  }
}
