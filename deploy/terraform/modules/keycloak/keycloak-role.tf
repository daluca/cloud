resource "keycloak_role" "nextcloud_admin" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.nextcloud.id

  name        = "admin"
  description = "Admin group on Nextcloud."
}

resource "keycloak_role" "nextcloud_user" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.nextcloud.id

  name        = "user"
  description = "User group on Nextcloud."
}

data "keycloak_role" "realm_management_realm_admin" {
  realm_id  = data.keycloak_realm.main.id
  client_id = data.keycloak_openid_client.realm_management.id

  name = "realm-admin"
}
