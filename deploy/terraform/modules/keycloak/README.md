# Keycloak module

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| keycloak | >= 4.0, < 5.0 |
| kubernetes | >= 2.0, < 3.0 |

## Resources

| Name | Type |
|------|------|
| [keycloak_generic_protocol_mapper.groups_mapper](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/generic_protocol_mapper) | resource |
| [keycloak_group.administrators](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group) | resource |
| [keycloak_group.mealie_admin](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group) | resource |
| [keycloak_group.mealie_user](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group) | resource |
| [keycloak_group.users](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group) | resource |
| [keycloak_group_roles.administrator_roles](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group_roles) | resource |
| [keycloak_group_roles.mealie_administrator_roles](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group_roles) | resource |
| [keycloak_group_roles.mealie_user_roles](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group_roles) | resource |
| [keycloak_group_roles.user_roles](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/group_roles) | resource |
| [keycloak_ldap_group_mapper.groups](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/ldap_group_mapper) | resource |
| [keycloak_ldap_user_federation.openldap](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/ldap_user_federation) | resource |
| [keycloak_openid_audience_protocol_mapper.oauth2_proxy](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_audience_protocol_mapper) | resource |
| [keycloak_openid_client.headscale](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client) | resource |
| [keycloak_openid_client.mealie](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client) | resource |
| [keycloak_openid_client.miniflux](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client) | resource |
| [keycloak_openid_client.nextcloud](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client) | resource |
| [keycloak_openid_client.oauth2_proxy](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client) | resource |
| [keycloak_openid_client.synapse](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client) | resource |
| [keycloak_openid_client_optional_scopes.mealie_optional_scopes](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client_optional_scopes) | resource |
| [keycloak_openid_client_optional_scopes.oauth2_proxy_optional_scopes](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client_optional_scopes) | resource |
| [keycloak_openid_client_scope.group](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client_scope) | resource |
| [keycloak_openid_user_attribute_protocol_mapper.nextcloud_quota](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_user_attribute_protocol_mapper) | resource |
| [keycloak_openid_user_client_role_protocol_mapper.mealie_groups](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_user_client_role_protocol_mapper) | resource |
| [keycloak_openid_user_client_role_protocol_mapper.nextcloud_groups](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_user_client_role_protocol_mapper) | resource |
| [keycloak_role.mealie_admin](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/role) | resource |
| [keycloak_role.mealie_user](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/role) | resource |
| [keycloak_role.nextcloud_admin](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/role) | resource |
| [keycloak_role.nextcloud_user](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/role) | resource |
| [kubernetes_secret.headscale_openid_connect](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.mealie_openid_connect](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.miniflux_openid_connect](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.nextcloud_openid_connect](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.oauth2_proxy_openid_connect](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.synapse_openid_connect](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [keycloak_openid_client.realm_management](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/data-sources/openid_client) | data source |
| [keycloak_realm.main](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/data-sources/realm) | data source |
| [keycloak_role.realm_management_realm_admin](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/data-sources/role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domains | Additional domain for applications. | ```object({ matrix = optional(string) })``` | n/a | yes |
| keycloak | Keycloak realm settings. | ```object({ realm = string domain = string })``` | n/a | yes |
| openldap | Openldap settings. | ```object({ connection_url = optional(string) domain_components = string credentials = object({ username = string password = string }) })``` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| administrators\_id | Keycloak Admin group ID. |
| nextcloud\_client\_id | Nextcloud OpenID Connect client-id. |
| nextcloud\_client\_secret | Nextcloud OpenID Connect client-secret. |
| realm\_id | Keycloak realm ID. |
| users\_id | Keycloak User group ID. |

<!-- END-TF-DOCS ---->
