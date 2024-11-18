resource "keycloak_group" "admins" {
  realm_id = data.keycloak_realm.main.id

  name = "Admins"
}

resource "keycloak_group" "users" {
  realm_id = data.keycloak_realm.main.id

  name = "Users"
}

resource "keycloak_group" "realm_admins" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.admins.id

  name = "Realm Admins"
}

resource "keycloak_group_roles" "realm_admins_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.realm_admins.id

  role_ids = [
    data.keycloak_role.realm_management_realm_admins.id,
  ]
}

resource "keycloak_group" "nextcloud_admins" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.admins.id

  name = "Nextcloud Admins"
}

resource "keycloak_group_roles" "nextcloud_admins_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.nextcloud_admins.id

  role_ids = [
    keycloak_role.nextcloud_admins.id
  ]
}

resource "keycloak_group" "nextcloud_users" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.users.id

  name = "Nextcloud Users"
}

resource "keycloak_group_roles" "nextcloud_users_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.nextcloud_users.id

  role_ids = [
    keycloak_role.nextcloud_users.id
  ]
}

resource "keycloak_group" "tailscale_users" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.users.id

  name = "Tailscale Users"
}

resource "keycloak_group" "mealie_admins" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.admins.id

  name = "Mealie Admins"
}

resource "keycloak_group_roles" "mealie_admins_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.mealie_admins.id

  role_ids = [
    keycloak_role.mealie_admins.id
  ]
}

resource "keycloak_group" "mealie_users" {
  realm_id  = data.keycloak_realm.main.id
  parent_id = keycloak_group.users.id

  name = "Mealie Users"
}


resource "keycloak_group_roles" "mealie_users_roles" {
  realm_id = data.keycloak_realm.main.id
  group_id = keycloak_group.mealie_users.id

  role_ids = [
    keycloak_role.mealie_users.id
  ]
}
