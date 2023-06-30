resource "keycloak_user" "main" {
  realm_id = module.staging.realm_id

  first_name = var.user.first_name
  last_name  = var.user.last_name
  username   = var.user.username
  email      = var.user.email

  attributes = {
    "quota" = var.user.quota != null ? var.user.quota : "none"
  }

  lifecycle {
    ignore_changes = [
      attributes["createTimestamp"],
      attributes["modifyTimestamp"],
      attributes["LDAP_ENTRY_DN"],
      attributes["LDAP_ID"]
    ]
  }
}

resource "keycloak_user_groups" "main" {
  realm_id = module.staging.realm_id
  user_id  = keycloak_user.main.id

  group_ids = [
    module.staging.administrators_id,
    module.staging.users_id
  ]
}
