# Production Keycloak

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| production | ../../modules/keycloak | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain | Domain for client applications. | `string` | n/a | yes |
| domain\_components | OpenLDAP domain component. | `string` | n/a | yes |
| matrix\_domain | Domain for matrix client application. | `string` | n/a | yes |
| openldap\_password | OpenLDAP admin password. | `string` | n/a | yes |
| openldap\_username | OpenLDAP admin username. | `string` | n/a | yes |

<!-- END-TF-DOCS ---->
