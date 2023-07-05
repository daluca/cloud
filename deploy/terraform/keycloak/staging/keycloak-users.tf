resource "keycloak_user" "users" {
  depends_on = [module.staging]
  for_each   = var.users

  realm_id = module.staging.realm_id

  username       = each.key
  first_name     = each.value["first_name"]
  last_name      = each.value["last_name"]
  email          = each.value["email"].address
  email_verified = each.value["email"].verified != null ? each.value["email"].verified : false

  attributes = {
    "quota" = each.value["quota"] != null ? each.value["quota"] : "none"
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
  for_each = var.users

  realm_id = module.staging.realm_id
  user_id  = keycloak_user.users[each.key].id

  group_ids = each.value["groups"] != null ? distinct(concat(
    [for group in each.value["groups"] : module.staging.groups[group].id], [module.staging.groups["/Users"].id]
  )) : [module.staging.groups["/Users"].id]
}
