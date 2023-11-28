resource "keycloak_openid_client_scope" "group" {
  realm_id = data.keycloak_realm.main.id

  name                   = "groups"
  description            = "OpenID Connect scope for mapping a user's group membership to a claim"
  include_in_token_scope = true
}

resource "keycloak_generic_protocol_mapper" "groups_mapper" {
  realm_id        = data.keycloak_realm.main.id
  client_scope_id = keycloak_openid_client_scope.group.id

  name            = "groups-mapper"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-group-membership-mapper"

  config = {
    "claim.name" : "groups"
    "full.path" : "false",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true"
    "multivalued" : "true"
  }
}
