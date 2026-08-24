module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.25"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 3.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}

module "public_ip" {
  source  = "cloudnationhq/pip/azure"
  version = "~> 5.0"

  configs = {
    pub1 = {
      name                = module.naming.public_ip.name_unique
      location            = module.rg.groups.demo.location
      resource_group_name = module.rg.groups.demo.name
      zones               = ["1", "2", "3"]
    }
  }
}
