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
  version = "~> 3.0"

  configs = {
    pub = {
      name                = module.naming.public_ip.name
      location            = module.rg.groups.demo.location
      resource_group      = module.rg.groups.demo.name
      public_ip_prefix_id = module.prefixes.configs.pub1.id

      zones = ["1", "2", "3"]
    }
  }
}

module "prefixes" {
  source  = "cloudnationhq/pip/azure//modules/prefixes"
  version = "~> 3.0"

  resource_group = module.rg.groups.demo.name
  location       = module.rg.groups.demo.location

  configs = {
    pub1 = {
      name          = module.naming.public_ip_prefix.name
      prefix_length = 31
      zones         = ["1", "2", "3"]
    }
  }
}
