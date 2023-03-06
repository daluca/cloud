variable "region" {
  description = "Location of resources."
  type        = string
}

variable "environment" {
  description = "Logical stage of deployment."
  type        = string
}

variable "domain" {
  description = "Domain to host applications."
  type        = string
  sensitive   = true
}

variable "kubernetes_version" {
  description = "Kubernetes cluster major and minor version."
  type        = string
}

variable "kubernetes_node_count" {
  description = "Number of kubernetes worker nodes."
  type        = number
}

variable "github_repository" {
  description = "GitHub repository for Flux to sync with."
  type        = string
}

variable "flux_version" {
  description = "Flux manifest version."
  type        = string
}

variable "cloudflare_domain" {
  description = "Cloudflare hosted domain."
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account id."
  type        = string
  sensitive   = true
}

variable "cloudflare_ip_allow_list" {
  description = "IP allow list for Cloudflare WAF"
  type        = string
  sensitive   = false

  validation {
    condition     = can(cidrnetmask(var.cloudflare_ip_allow_list))
    error_message = "Must be a valid IPv4 CIDR range."
  }
}
