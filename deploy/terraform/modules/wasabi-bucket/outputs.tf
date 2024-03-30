output "id" {
  description = "Wasabi S3 bucket name."
  value       = wasabi_bucket.bucket.id
}

output "arn" {
  description = "Wasabi S3 bukcet ARN."
  value       = wasabi_bucket.bucket.arn
}

output "bucket" {
  description = "Wasabi S3 bucket name."
  value       = wasabi_bucket.bucket.bucket
  sensitive   = true
}
