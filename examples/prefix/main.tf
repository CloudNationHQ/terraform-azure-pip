module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.24"

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
  version = "~> 4.0"

  naming = local.naming

  configs = {
    pub1 = {
      location            = module.rg.groups.demo.location
      resource_group_name = module.rg.groups.demo.name
      public_ip_prefix_id = module.prefixes.configs.pub1.id
      zones               = ["1", "2", "3"]
    }
  }
}

module "prefixes" {
  source  = "cloudnationhq/pip/azure//modules/prefixes"
  version = "~> 4.0"

  naming = local.naming

  resource_group_name = module.rg.groups.demo.name
  location            = module.rg.groups.demo.location

  configs = {
    pub1 = {
      prefix_length = 31
      zones         = ["1", "2", "3"]
    }
  }
}
