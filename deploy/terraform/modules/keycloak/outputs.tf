output "realm_id" {
  description = "Keycloak realm ID."
  value       = data.keycloak_realm.main.id
}

output "administrators_id" {
  description = "Keycloak Admin group ID."
  value       = keycloak_group.administrators.id
}

output "users_id" {
  description = "Keycloak User group ID."
  value       = keycloak_group.users.id
}

output "nextcloud_client_id" {
  description = "Nextcloud OpenID Connect client-id."
  value       = keycloak_openid_client.nextcloud.client_id
}

output "nextcloud_client_secret" {
  description = "Nextcloud OpenID Connect client-secret."
  value       = keycloak_openid_client.nextcloud.client_secret
  sensitive   = true
}

output "groups" {
  description = "Map of Keycloak groups."
  value       = local.groups
}
