# Users module

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| keycloak | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| keycloak | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [keycloak_user.users](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/user) | resource |
| [keycloak_user_groups.main](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/user_groups) | resource |
| [keycloak_group.administrators](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/data-sources/group) | data source |
| [keycloak_group.users](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/data-sources/group) | data source |
| [keycloak_realm.environment](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/data-sources/realm) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| keycloak | Keycloak realm settings. | ```object({ realm = string })``` | n/a | yes |
| users | Keycloak user settings. | ```map(object({ username = string first_name = string last_name = string email = object({ address = string verified = optional(bool) }) quota = optional(string) groups = optional(list(string)) }))``` | n/a | yes |

<!-- END-TF-DOCS ---->
