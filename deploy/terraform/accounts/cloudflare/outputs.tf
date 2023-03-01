output "terraform_api_token" {
  description = "Cloudflare api token for terraform"
  value       = cloudflare_api_token.terraform.value
  sensitive   = true
}
