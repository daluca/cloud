resource "keycloak_group" "administrators" {
  realm_id = data.keycloak_realm.main.id
  name     = "Administrators"
}

resource "keycloak_group" "users" {
  realm_id = data.keycloak_realm.main.id
  name     = "Users"
}

resource "keycloak_group_roles" "administrator_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.administrators.id

  role_ids = [
    keycloak_role.nextcloud_admin.id
  ]
}

resource "keycloak_group_roles" "user_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.users.id

  role_ids = [
    keycloak_role.nextcloud_user.id
  ]
}
