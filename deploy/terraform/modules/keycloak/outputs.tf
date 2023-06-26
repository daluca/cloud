output "nextcloud_client_id" {
  description = "Nextcloud OpenID Connect client-id."
  value       = keycloak_openid_client.nextcloud.client_id
}

output "nextcloud_client_secret" {
  description = "Nextcloud OpenID Connect client-secret."
  value       = keycloak_openid_client.nextcloud.client_secret
  sensitive   = true
}
