resource "keycloak_group" "administrators" {
  realm_id = data.keycloak_realm.main.id

  name = "Administrators"
}

resource "keycloak_group_roles" "administrator_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.administrators.id

  role_ids = [
    data.keycloak_role.realm_management_realm_admin.id,
    keycloak_role.nextcloud_admin.id
  ]
}

resource "keycloak_group" "users" {
  realm_id = data.keycloak_realm.main.id

  name = "Users"
}

resource "keycloak_group_roles" "user_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.users.id

  role_ids = [
    keycloak_role.nextcloud_user.id
  ]
}

resource "keycloak_group" "mealie_admin" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.administrators.id

  name = "MealieAdmin"
}

resource "keycloak_group_roles" "mealie_administrator_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.mealie_admin.id

  role_ids = [
    keycloak_role.mealie_admin.id
  ]
}

resource "keycloak_group" "mealie_user" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.users.id

  name = "MealieUser"
}


resource "keycloak_group_roles" "mealie_user_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.mealie_user.id

  role_ids = [
    keycloak_role.mealie_user.id
  ]
}
