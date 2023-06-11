variable "primary_domain" {
  description = "Primary domain to be host on Cloudflare and used for applications."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-z_-]{2,}\\.[a-z]{2,}(\\.[a-z]{2,})?$", var.primary_domain))
    error_message = "String must conform to Second level domain."
  }
}

variable "cloudflare_allowlist" {
  description = "IP allowlist for Kubernetes hosted apps"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.cloudflare_allowlist))
    error_message = "Allowlist be a valid IPv4 CIDR range."
  }
}

variable "flux_age_key" {
  description = "Base64 encoded age key used to decrypt secrets in Kubernetes cluster."
  type        = string
}
