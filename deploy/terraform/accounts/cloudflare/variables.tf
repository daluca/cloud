variable "cloudflare_user_id" {
  description = "Cloudflare user ID."
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID."
  type        = string
  sensitive   = true
}

variable "primary_domain" {
  description = "Primary domain to host in Cloudflare."
  type        = string
  sensitive   = true
}

variable "secondary_domain" {
  description = "Secondary domain to host in Cloudflare."
  type        = string
  sensitive   = true
}

variable "tertiary_domain" {
  description = "Tertiary domain to host in Cloudflare."
  type        = string
  sensitive   = true
}

variable "staging_domain" {
  description = "Staging domain to host in Cloudflare."
  type        = string
  sensitive   = true
}
