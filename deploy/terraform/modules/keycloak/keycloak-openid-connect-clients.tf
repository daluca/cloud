locals {
  matrix_domain = var.keycloak.realm == "production" ? var.domains.matrix != null ? var.domains.matrix : var.keycloak.domain : var.keycloak.domain
}

resource "keycloak_openid_client" "nextcloud" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "nextcloud-user_oidc"

  name    = "Nextcloud"
  enabled = true

  access_type = "CONFIDENTIAL"

  root_url            = sensitive("https://cloud.${var.keycloak.domain}")
  valid_redirect_uris = ["/", "/apps/user_oidc/code"]
  web_origins         = ["+"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = true

  backchannel_logout_url              = sensitive("https://cloud.${var.keycloak.domain}/apps/user_oidc/backchannel-logout/sso.${var.keycloak.domain}")
  backchannel_logout_session_required = true

  extra_config = {
    "id.token.signed.response.alg" = "RS256"
  }
}

resource "keycloak_openid_user_client_role_protocol_mapper" "nextcloud_groups" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.nextcloud.id

  name       = "groups"
  claim_name = "groups"

  client_id_for_role_mappings = keycloak_openid_client.nextcloud.client_id

  multivalued = true
}

resource "keycloak_openid_user_attribute_protocol_mapper" "nextcloud_quota" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.nextcloud.id

  name           = "quota"
  claim_name     = "quota"
  user_attribute = "quota"
}

data "keycloak_openid_client" "realm_management" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "realm-management"
}

resource "keycloak_openid_client" "miniflux" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "miniflux"

  name    = "Miniflux"
  enabled = true

  access_type = "CONFIDENTIAL"

  root_url            = sensitive("https://feeds.${var.keycloak.domain}")
  valid_redirect_uris = ["/oauth2/oidc/callback"]
  web_origins         = ["+"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = true
}

resource "keycloak_openid_client" "oauth2_proxy" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "oauth2-proxy"

  name    = "OAuth2 Proxy"
  enabled = true

  access_type = "CONFIDENTIAL"

  root_url            = sensitive("https://auth.${var.keycloak.domain}")
  valid_redirect_uris = ["/oauth2/callback"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = false
}

resource "keycloak_openid_client_optional_scopes" "oauth2_proxy_optional_scopes" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.oauth2_proxy.id

  optional_scopes = [
    "address",
    "phone",
    "offline_access",
    "microprofile-jwt",
    keycloak_openid_client_scope.group.name
  ]
}

resource "keycloak_openid_audience_protocol_mapper" "oauth2_proxy" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.oauth2_proxy.id

  name                     = "aud-mapper-oauth2-proxy"
  included_client_audience = keycloak_openid_client.oauth2_proxy.client_id

  add_to_id_token     = true
  add_to_access_token = true
}

resource "keycloak_openid_client" "synapse" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "synapse"

  name    = "Synapse"
  enabled = true

  access_type = "CONFIDENTIAL"

  root_url            = sensitive("https://matrix.${local.matrix_domain}")
  valid_redirect_uris = ["/_synapse/client/oidc/callback"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = true

  backchannel_logout_url              = sensitive("https://matrix.${var.keycloak.domain}/_synapse/client/oidc/backchannel_logout")
  backchannel_logout_session_required = true
}

resource "keycloak_openid_client" "headscale" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "headscale"

  name    = "Headscale"
  enabled = true

  access_type = "CONFIDENTIAL"

  root_url            = sensitive("https://headscale.${var.keycloak.domain}")
  valid_redirect_uris = ["/oidc/callback"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = true
}

resource "keycloak_openid_client_optional_scopes" "headscale_optional_scopes" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.headscale.id

  optional_scopes = [
    "address",
    "phone",
    "offline_access",
    "microprofile-jwt",
    keycloak_openid_client_scope.group.name
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "tailscale_groups" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.headscale.id

  name       = "groups"
  claim_name = "groups"

  client_id_for_role_mappings = keycloak_openid_client.headscale.client_id

  multivalued = true
}

resource "keycloak_openid_client" "mealie" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "mealie"

  name    = "Mealie"
  enabled = true

  access_type = "CONFIDENTIAL"

  root_url            = sensitive("https://mealie.${var.keycloak.domain}")
  valid_redirect_uris = ["/login", "/login?direct=1"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = true
}

resource "keycloak_openid_client_optional_scopes" "mealie_optional_scopes" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.mealie.id

  optional_scopes = [
    "address",
    "phone",
    "offline_access",
    "microprofile-jwt",
    keycloak_openid_client_scope.group.name
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "mealie_groups" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.mealie.id

  name       = "groups"
  claim_name = "groups"

  client_id_for_role_mappings = keycloak_openid_client.mealie.client_id

  multivalued = true
}

resource "keycloak_openid_client" "linkwarden" {
  realm_id  = data.keycloak_realm.main.id
  client_id = "linkwarden"

  name    = "Linkwarden"
  enabled = true

  access_type = "CONFIDENTIAL"

  root_url            = sensitive("https://links.${var.keycloak.domain}")
  valid_redirect_uris = ["/api/v1/auth/callback/keycloak"]

  standard_flow_enabled        = true
  direct_access_grants_enabled = true
}
