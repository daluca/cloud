variable "environment" {
  description = "Logical stage of deployment."
  type        = string

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be one of ['development', 'staging', 'production']."
  }
}

variable "digitalocean_region" {
  description = "DigitalOcean region where kubernetes resources will be located."
  type        = string

  validation {
    condition     = contains(["nyc1", "nyc3", "ams3", "sfo3", "sgp1", "lon1", "fra1", "tor1", "blr1", "syd1"], var.digitalocean_region)
    error_message = "Region must be one of ['nyc1', 'nyc3', 'ams3', 'sfo3', 'sgp1', 'lon1', 'fra1', 'tor1', 'blr1', 'syd1']."
  }
}

variable "kubernetes_version" {
  description = "Major and minor version of kubernetes cluster supported by DigitalOcean."
  type        = string

  validation {
    condition     = contains(["1.24", "1.25", "1.26"], var.kubernetes_version)
    error_message = "Kubernetes version must be one of ['1.24', '1.25', '1.26]."
  }
}

variable "kubernetes_worker_cpu" {
  description = "Kubernetes worker virtual cpu count."
  type        = number

  validation {
    condition     = var.kubernetes_worker_cpu >= 1
    error_message = "vCPU count must be greater than or equal to 1."
  }
}

variable "kubernetes_worker_memory" {
  description = "Kubernetes worker RAM in GiB."
  type        = number

  validation {
    condition     = var.kubernetes_worker_memory >= 1
    error_message = "RAM must be greater than or equal to 1."
  }
}

variable "kubernetes_monitoring_pool" {
  description = "Enable separate node pool for monitoring."
  type        = bool
  default     = false
}

variable "kubernetes_monitoring_cpu" {
  description = "Kubernetes monitoring virtual cpu count."
  type        = number
  default     = 1

  validation {
    condition     = var.kubernetes_monitoring_cpu >= 1
    error_message = "vCPU count must be greater than or equal to 1."
  }
}

variable "kubernetes_monitoring_memory" {
  description = "Kubernetes monitoring RAM in GiB."
  type        = number
  default     = 2

  validation {
    condition     = var.kubernetes_monitoring_memory >= 1
    error_message = "RAM must be greater than or equal to 1."
  }
}

variable "domain" {
  description = "Domain to be hosted on Cloudflare and used for applications."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-z_-]{2,}\\.[a-z]{2,}(\\.[a-z]{2,})?$", var.domain))
    error_message = "String must conform to Second level domain."
  }
}

variable "cloudflare_account_name" {
  description = "Name of Cloudflare account."
  type        = string
}

variable "cloudflare_ip_allow_list" {
  description = "A CIDR range of allow IP address to access environment resources."
  type        = string
  default     = ""
}

variable "github_repository" {
  description = "GitHub repository to sync with Flux."
  type        = string
}

variable "block_external_traffic" {
  description = "Include WAF rule to block traffic that isn't in the allowed range."
  type        = bool
  default     = false
}
