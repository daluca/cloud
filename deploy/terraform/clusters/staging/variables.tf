variable "cloudflare_domain" {
  description = "Domain to be host on Cloudflare and used for applications."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-z_-]{2,}\\.[a-z]{2,}(\\.[a-z]{2,})?$", var.cloudflare_domain))
    error_message = "String must conform to Second level domain."
  }
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID."
  type        = string
}

variable "cloudflare_ip_allow_list" {
  description = "IP allow list for Kubernetes hosted apps"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.cloudflare_ip_allow_list))
    error_message = "Allow list be a valid IPv4 CIDR range."
  }
}

variable "flux_age_key" {
  description = "Base64 encoded age key used to decrypt secrets in Kubernetes cluster."
  type        = string
}
