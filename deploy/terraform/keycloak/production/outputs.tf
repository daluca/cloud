output "nextcloud_client_id" {
  description = "Nextcloud OpenID Connect client-id."
  value       = module.staging.nextcloud_client_id
}

output "nextcloud_client_secret" {
  description = "Nextcloud OpenID Connect client-secret."
  value       = module.staging.nextcloud_client_secret
  sensitive   = true
}
