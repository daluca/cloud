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
