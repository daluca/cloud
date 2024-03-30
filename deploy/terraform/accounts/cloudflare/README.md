# Cloudflare account

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| cloudflare | ~> 4.0 |
| time | ~> 0.9.0 |

## Providers

| Name | Version |
|------|---------|
| cloudflare | ~> 4.0 |
| time | ~> 0.9.0 |

## Resources

| Name | Type |
|------|------|
| [cloudflare_api_token.terraform](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token) | resource |
| [cloudflare_zone.primary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_zone.secondary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_zone.staging](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_zone.tertiary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_zone_settings_override.primary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override) | resource |
| [cloudflare_zone_settings_override.secondary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override) | resource |
| [cloudflare_zone_settings_override.staging](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override) | resource |
| [cloudflare_zone_settings_override.tertiary](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override) | resource |
| [time_offset.one_year_from_now](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/offset) | resource |
| [cloudflare_api_token_permission_groups.all](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/api_token_permission_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudflare\_account\_id | Cloudflare account ID. | `string` | n/a | yes |
| cloudflare\_user\_id | Cloudflare user ID. | `string` | n/a | yes |
| primary\_domain | Primary domain to host in Cloudflare. | `string` | n/a | yes |
| secondary\_domain | Secondary domain to host in Cloudflare. | `string` | n/a | yes |
| staging\_domain | Staging domain to host in Cloudflare. | `string` | n/a | yes |
| tertiary\_domain | Tertiary domain to host in Cloudflare. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| terraform\_api\_token | Cloudflare api token for terraform |

<!-- END-TF-DOCS ---->
