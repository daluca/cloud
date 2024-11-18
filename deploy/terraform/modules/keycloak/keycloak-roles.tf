data "keycloak_role" "realm_management_realm_admins" {
  realm_id  = data.keycloak_realm.main.id
  client_id = data.keycloak_openid_client.realm_management.id

  name = "realm-admin"
}

resource "keycloak_role" "nextcloud_admins" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.nextcloud.id

  name        = "admin"
  description = "Admins group on Nextcloud."
}

resource "keycloak_role" "nextcloud_users" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.nextcloud.id

  name        = "user"
  description = "Users group on Nextcloud."
}

resource "keycloak_role" "mealie_admins" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.mealie.id

  name        = "admin"
  description = "Admins group on Mealie."
}
resource "keycloak_role" "mealie_users" {
  realm_id  = data.keycloak_realm.main.id
  client_id = keycloak_openid_client.mealie.id

  name        = "user"
  description = "Users group on Mealie."
}
