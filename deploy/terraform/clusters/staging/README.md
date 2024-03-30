# Staging cluster

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| aws | ~> 5.0 |
| cloudflare | ~> 4.0 |
| flux | ~> 1.0 |
| kubernetes | ~> 2.0 |
| wasabi | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| cloudflare | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| staging | ../../modules/environment | n/a |

## Resources

| Name | Type |
|------|------|
| [cloudflare_ruleset.waf_rules](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/ruleset) | resource |
| [cloudflare_zone_settings_override.primary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override) | resource |
| [cloudflare_zone.primary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudflare\_allowlist | IP allowlist for Kubernetes hosted apps | `string` | n/a | yes |
| flux\_age\_key | Base64 encoded age key used to decrypt secrets in Kubernetes cluster. | `string` | n/a | yes |
| primary\_domain | Primary domain to be host on Cloudflare and used for applications. | `string` | n/a | yes |

<!-- END-TF-DOCS ---->
