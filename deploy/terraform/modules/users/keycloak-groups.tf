locals {
  groups = {
    (data.keycloak_group.admins.path)           = data.keycloak_group.admins
    (data.keycloak_group.users.path)            = data.keycloak_group.users
    (data.keycloak_group.realm_admins.path)     = data.keycloak_group.realm_admins
    (data.keycloak_group.nextcloud_admins.path) = data.keycloak_group.nextcloud_admins
    (data.keycloak_group.nextcloud_users.path)  = data.keycloak_group.nextcloud_users
    (data.keycloak_group.tailscale_users.path)  = data.keycloak_group.tailscale_users
    (data.keycloak_group.mealie_admins.path)    = data.keycloak_group.mealie_admins
    (data.keycloak_group.mealie_users.path)     = data.keycloak_group.mealie_users
  }
}

data "keycloak_group" "admins" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Admins"
}

data "keycloak_group" "users" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Users"
}

data "keycloak_group" "realm_admins" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Realm Admins"
}

data "keycloak_group" "nextcloud_admins" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Nextcloud Admins"
}

data "keycloak_group" "nextcloud_users" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Nextcloud Users"
}

data "keycloak_group" "tailscale_users" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Tailscale Users"
}

data "keycloak_group" "mealie_admins" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Mealie Admins"
}

data "keycloak_group" "mealie_users" {
  realm_id = data.keycloak_realm.environment.id
  name     = "Mealie Users"
}
