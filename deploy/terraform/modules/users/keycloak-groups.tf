locals {
  groups = {
    (data.keycloak_group.administrators.path) = data.keycloak_group.administrators
    (data.keycloak_group.users.path)          = data.keycloak_group.users
    (data.keycloak_group.mealie_admin.path)   = data.keycloak_group.mealie_admin
    (data.keycloak_group.mealie_user.path)    = data.keycloak_group.mealie_user
  }
}

data "keycloak_group" "administrators" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Administrators"
}

data "keycloak_group" "users" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Users"
}

data "keycloak_group" "mealie_admin" {
  realm_id = data.keycloak_realm.environment.id
  name     = "MealieAdmin"
}

data "keycloak_group" "mealie_user" {
  realm_id = data.keycloak_realm.environment.id
  name     = "MealieUser"
}
