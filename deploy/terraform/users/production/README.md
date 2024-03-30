# Production users

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| production | ../../modules/users | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| users | Keycloak user settings. | ```map(object({ username = string first_name = string last_name = string email = object({ address = string verified = optional(bool) }) quota = optional(string) groups = optional(list(string)) }))``` | n/a | yes |

<!-- END-TF-DOCS ---->
