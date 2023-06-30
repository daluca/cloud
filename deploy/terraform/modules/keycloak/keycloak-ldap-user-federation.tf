resource "keycloak_ldap_user_federation" "openldap" {
  realm_id = data.keycloak_realm.main.id
  name     = "openldap"
  enabled  = true

  edit_mode          = "WRITABLE"
  sync_registrations = true

  username_ldap_attribute = "uid"
  rdn_ldap_attribute      = "uid"
  uuid_ldap_attribute     = "entryUUID"
  user_object_classes = [
    "inetOrgPerson",
    "organizationalPerson"
  ]

  connection_url  = var.openldap.connection_url == null ? "ldap://openldap.identity" : var.openldap.connection_url
  users_dn        = "ou=People,${var.openldap.domain_components}"
  bind_dn         = "cn=${var.openldap.credentials.username},${var.openldap.domain_components}"
  bind_credential = var.openldap.credentials.password
}

resource "keycloak_ldap_group_mapper" "groups" {
  ldap_user_federation_id = keycloak_ldap_user_federation.openldap.id
  realm_id                = data.keycloak_realm.main.id
  name                    = "groups"

  ldap_groups_dn                 = "ou=Groups,${var.openldap.domain_components}"
  group_name_ldap_attribute      = "cn"
  group_object_classes           = ["groupOfUniqueNames"]
  membership_attribute_type      = "DN"
  membership_ldap_attribute      = "uniqueMember"
  membership_user_ldap_attribute = "uid"
  memberof_ldap_attribute        = "memberOf"
  mode                           = "LDAP_ONLY"
  user_roles_retrieve_strategy   = "LOAD_GROUPS_BY_MEMBER_ATTRIBUTE"
  mapped_group_attributes        = []
}
