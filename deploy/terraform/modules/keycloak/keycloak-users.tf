resource "keycloak_user" "main" {
  depends_on = [
    keycloak_ldap_user_federation.openldap,
    keycloak_ldap_group_mapper.group
  ]

  for_each = { for index, user in var.keycloak.users : user.username => user }

  realm_id = data.keycloak_realm.main.id
  username = each.value.username

  first_name = each.value.first_name
  last_name  = each.value.last_name
  email      = each.value.email

  lifecycle {
    ignore_changes = [attributes]
  }
}
