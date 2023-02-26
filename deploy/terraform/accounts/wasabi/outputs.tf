output "terraform_access_key" {
  description = "Wasabi access key for terraform user."
  value       = sensitive(aws_iam_access_key.terraform.id)
  sensitive   = true
}

output "terraform_secret_key" {
  description = "Wasabi secret key for terraform user."
  value       = aws_iam_access_key.terraform.secret
  sensitive   = true
}

output "minio_client_access_key" {
  description = "Wasabi access key for minio-client user."
  value       = sensitive(aws_iam_user.minio_client.id)
  sensitive   = true
}

output "minio_client_secret_key" {
  description = "Wasabi secret key for minio-client user."
  value       = aws_iam_access_key.minio_client.secret
  sensitive   = true
}

output "wasabi_account_alias" {
  description = "Wasabi account alias."
  value       = sensitive(wasabi_account_alias.main.id)
  sensitive   = true
}
