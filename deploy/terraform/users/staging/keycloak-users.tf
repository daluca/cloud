resource "keycloak_user" "users" {
  for_each = var.users

  realm_id = data.keycloak_realm.staging.id

  username       = sensitive(each.value["username"])
  first_name     = sensitive(each.value["first_name"])
  last_name      = sensitive(each.value["last_name"])
  email          = sensitive(each.value["email"].address)
  email_verified = each.value["email"].verified != null ? each.value["email"].verified : false

  attributes = {
    "quota" = each.value["quota"] != null ? each.value["quota"] : "none"
  }

  lifecycle {
    ignore_changes = [
      email_verified,
      attributes["createTimestamp"],
      attributes["modifyTimestamp"],
      attributes["LDAP_ENTRY_DN"],
      attributes["LDAP_ID"]
    ]
  }
}

resource "keycloak_user_groups" "main" {
  for_each = var.users

  realm_id = data.keycloak_realm.staging.id
  user_id  = keycloak_user.users[each.key].id

  group_ids = each.value["groups"] != null ? distinct(concat(
    [for group in each.value["groups"] : local.groups[group].id], [local.groups["/Users"].id]
  )) : [local.groups["/Users"].id]
}
