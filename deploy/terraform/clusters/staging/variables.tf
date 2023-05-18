variable "environment" {
  description = "Logical stage of deployment."
  type        = string

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be one of ['development', 'staging', 'production']."
  }
}

variable "kubernetes_version" {
  description = "Kubernetes cluster major and minor version."
  type        = string

  validation {
    condition     = contains(["nyc1", "nyc3", "ams3", "sfo3", "sgp1", "lon1", "fra1", "tor1", "blr1", "syd1"], var.digitalocean_region)
    error_message = "Region must be one of ['nyc1', 'nyc3', 'ams3', 'sfo3', 'sgp1', 'lon1', 'fra1', 'tor1', 'blr1', 'syd1']."
  }
}

variable "github_repository" {
  description = "GitHub repository to sync with Flux."
  type        = string
}

variable "cloudflare_account_name" {
  description = "Name of Cloudflare account."
  type        = string
}

variable "cloudflare_ip_allow_list" {
  description = "IP allow list for Kubernetes hosted apps"
  type        = string
}
