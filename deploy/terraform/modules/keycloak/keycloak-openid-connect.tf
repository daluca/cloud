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
