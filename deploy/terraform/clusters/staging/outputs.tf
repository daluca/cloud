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
