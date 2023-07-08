locals {
  groups = {
    (data.keycloak_group.administrators.path) = data.keycloak_group.administrators
    (data.keycloak_group.users.path)          = data.keycloak_group.users
  }
}

data "keycloak_group" "administrators" {
  realm_id = data.keycloak_realm.staging.id
  name     = "Administrators"
}

data "keycloak_group" "users" {
  realm_id = data.keycloak_realm.staging.id
  name     = "Users"
}
