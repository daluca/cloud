output "stackgres_access_key" {
  description = "Wasabi access key for stackgres user."
  value       = sensitive(aws_iam_access_key.stackgres.id)
  sensitive   = true
}

output "stackgres_secret_key" {
  description = "Wasabi secret key for stackgres user."
  value       = aws_iam_access_key.stackgres.secret
  sensitive   = true
}

output "stackgres_backup_bucket" {
  description = "Wasabi bucket for backing up with Stackgres."
  value       = module.stackgres_backup.bucket
  sensitive   = true
}

output "velero_access_key" {
  description = "Wasabi access key for velero user."
  value       = sensitive(aws_iam_access_key.velero.id)
  sensitive   = true
}

output "velero_secret_key" {
  description = "Wasabi secret key for velero user."
  value       = aws_iam_access_key.velero.secret
  sensitive   = true
}

output "velero_backup_bucket" {
  description = "Wasabi bucket for backing up with Velero."
  value       = module.velero_backup.bucket
  sensitive   = true
}

output "nextcloud_access_key" {
  description = "Wasabi access key for nextcloud user."
  value       = sensitive(aws_iam_access_key.nextcloud.id)
  sensitive   = true
}

output "nextcloud_secret_key" {
  description = "Wasabi secret key for nextcloud user."
  value       = aws_iam_access_key.nextcloud.secret
  sensitive   = true
}

output "cloudflare_nameservers" {
  description = "Cloudflare name servers for the tertiary domain."
  value       = cloudflare_zone.tertiary_domain.name_servers
}

output "external_dns_api_token" {
  description = "Cloudflare token for external-dns."
  value       = cloudflare_api_token.external_dns.value
  sensitive   = true
}

output "cert_manager_api_token" {
  description = "Cloudflare token for cert-manager."
  value       = cloudflare_api_token.cert_manager.value
  sensitive   = true
}
