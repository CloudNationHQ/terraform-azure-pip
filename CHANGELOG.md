# Changelog

## [2.5.0](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v2.4.0...v2.5.0) (2025-02-03)


### Features

* add ip_tags support ([#29](https://github.com/CloudNationHQ/terraform-azure-pip/issues/29)) ([928771a](https://github.com/CloudNationHQ/terraform-azure-pip/commit/928771ace285840cc6d472d31c6454c822ac6849))

## [2.4.0](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v2.3.0...v2.4.0) (2025-01-20)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#23](https://github.com/CloudNationHQ/terraform-azure-pip/issues/23)) ([a9c4b14](https://github.com/CloudNationHQ/terraform-azure-pip/commit/a9c4b140afe11e85b41af30abbb0ed36c9d77dce))
* **deps:** bump golang.org/x/crypto from 0.29.0 to 0.31.0 in /tests ([#26](https://github.com/CloudNationHQ/terraform-azure-pip/issues/26)) ([eaa64a3](https://github.com/CloudNationHQ/terraform-azure-pip/commit/eaa64a38967cd77bf5817a6940e38ba4418e6938))
* **deps:** bump golang.org/x/net from 0.31.0 to 0.33.0 in /tests ([#27](https://github.com/CloudNationHQ/terraform-azure-pip/issues/27)) ([068a8c5](https://github.com/CloudNationHQ/terraform-azure-pip/commit/068a8c5732a353ecb0e87b41b062c7b508e5757e))
* remove temporary files when deployment tests fails ([#24](https://github.com/CloudNationHQ/terraform-azure-pip/issues/24)) ([e8161ed](https://github.com/CloudNationHQ/terraform-azure-pip/commit/e8161ed448e9d16e9ba84dc0f30c30ba274c708e))

## [2.3.0](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v2.2.1...v2.3.0) (2024-11-22)


### Features

* support domain name label scope and sku tier on public ip prefixes ([#20](https://github.com/CloudNationHQ/terraform-azure-pip/issues/20)) ([0f30cc2](https://github.com/CloudNationHQ/terraform-azure-pip/commit/0f30cc2de011dff56ed2b3c0268324664ea82c86))

## [2.2.1](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v2.2.0...v2.2.1) (2024-11-20)


### Bug Fixes

* update types with map ([#18](https://github.com/CloudNationHQ/terraform-azure-pip/issues/18)) ([b7c91cd](https://github.com/CloudNationHQ/terraform-azure-pip/commit/b7c91cd9ec447ab2b5f61f039f74319e8828c8c4))

## [2.2.0](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v2.1.0...v2.2.0) (2024-11-11)


### Features

* enhance testing with sequential, parallel modes and flags for exceptions and skip-destroy ([#16](https://github.com/CloudNationHQ/terraform-azure-pip/issues/16)) ([9bf7543](https://github.com/CloudNationHQ/terraform-azure-pip/commit/9bf75431fb59f4b77758b3c18bdd9616980e5d5c))

## [2.1.0](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v2.0.1...v2.1.0) (2024-10-11)


### Features

* auto generated docs and refine makefile ([#14](https://github.com/CloudNationHQ/terraform-azure-pip/issues/14)) ([5674115](https://github.com/CloudNationHQ/terraform-azure-pip/commit/5674115fd6240468addfb321f3587b1c1b32732a))
* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#13](https://github.com/CloudNationHQ/terraform-azure-pip/issues/13)) ([6c81982](https://github.com/CloudNationHQ/terraform-azure-pip/commit/6c81982db2a4ea50fa4fc781c2a9b1fdd81dade6))

## [2.0.1](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v2.0.0...v2.0.1) (2024-09-25)


### Bug Fixes

* added additional optional config for public ip ([#10](https://github.com/CloudNationHQ/terraform-azure-pip/issues/10)) ([3250c84](https://github.com/CloudNationHQ/terraform-azure-pip/commit/3250c84e0f52ccdc7102cd877245492e3ed7e689))

## [2.0.0](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v1.1.1...v2.0.0) (2024-09-25)


### ⚠ BREAKING CHANGES

* Version 4 of the azurerm provider includes breaking changes.

### Features

* upgrade azurerm provider to v4 ([#8](https://github.com/CloudNationHQ/terraform-azure-pip/issues/8)) ([60a466f](https://github.com/CloudNationHQ/terraform-azure-pip/commit/60a466fc94d353d9a7e0fab601e7176ac6e52469))

### Upgrade from v1.1.1 to v2.0.0:

- Update module reference to: `version = "~> 2.0"`

## [1.1.1](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v1.1.0...v1.1.1) (2024-09-12)


### Bug Fixes

* change output name to be plural ([#6](https://github.com/CloudNationHQ/terraform-azure-pip/issues/6)) ([c8d8397](https://github.com/CloudNationHQ/terraform-azure-pip/commit/c8d839764cfb9b49168733ef490b3462cecfa08b))

## [1.1.0](https://github.com/CloudNationHQ/terraform-azure-pip/compare/v1.0.0...v1.1.0) (2024-09-11)


### Features

* add support for multiple public ip's ([#4](https://github.com/CloudNationHQ/terraform-azure-pip/issues/4)) ([4a608c6](https://github.com/CloudNationHQ/terraform-azure-pip/commit/4a608c65b5e6b27fb4713c7aa7df50c373413b0d))

## 1.0.0 (2024-09-11)


### Features

* add initial resources ([#1](https://github.com/CloudNationHQ/terraform-azure-pip/issues/1)) ([1ac5480](https://github.com/CloudNationHQ/terraform-azure-pip/commit/1ac54803dca498627b3106cf4d518f15fb9ac03d))
