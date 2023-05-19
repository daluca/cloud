variable "github" {
  description = "GitHub repository settings."
  type = object({
    repository = string
  })
}

variable "digitalocean" {
  description = "DigitalOcean cloud settings."
  type = object({
    environment = string
    region      = string
  })

  validation {
    condition     = contains(["nyc1", "nyc3", "ams3", "sfo3", "sgp1", "lon1", "fra1", "tor1", "blr1", "syd1"], var.digitalocean.region)
    error_message = "Region must be one of ['nyc1', 'nyc3', 'ams3', 'sfo3', 'sgp1', 'lon1', 'fra1', 'tor1', 'blr1', 'syd1']."
  }

  validation {
    condition     = contains(["development", "staging", "production"], var.digitalocean.environment)
    error_message = "Environment must be one of ['development', 'staging', 'production']."
  }
}

variable "cloudflare" {
  description = "Cloudflare CDN settings."
  type = object({
    account_name           = string
    domain                 = string
    allow_list             = optional(string)
    block_external_traffic = optional(bool, false)
  })

  validation {
    condition     = can(regex("^[0-9a-z_-]{2,}\\.[a-z]{2,}(\\.[a-z]{2,})?$", var.cloudflare.domain))
    error_message = "String must conform to Second level domain."
  }

  validation {
    condition     = can(cidrnetmask(var.cloudflare.allow_list))
    error_message = "Allow list be a valid IPv4 CIDR range."
  }
}

variable "kubernetes" {
  description = "Kubernetes cluster settings."
  type = object({
    version = optional(string)
    worker_pool = object({
      cpu        = number
      memory     = number
      min        = optional(number)
      max        = optional(number)
      auto_scale = optional(bool, false)
      count      = optional(number)
    })
    monitoring_pool = optional(object({
      cpu        = optional(number)
      memory     = optional(number)
      min        = optional(number)
      max        = optional(number)
      auto_scale = optional(bool, false)
      count      = optional(number)
    }))
  })

  validation {
    condition     = contains(["1.24", "1.25", "1.26"], var.kubernetes.version)
    error_message = "Kubernetes version must be one of ['1.24', '1.25', '1.26]."
  }

  validation {
    condition     = var.kubernetes.worker_pool.cpu >= 1
    error_message = "CPU count must be greater than or equal to 1."
  }

  validation {
    condition     = var.kubernetes.worker_pool.memory >= 1
    error_message = "RAM must be greater than or equal to 1."
  }

  validation {
    condition     = var.kubernetes.monitoring_pool.cpu >= 1
    error_message = "CPU count must be greater than or equal to 1."
  }

  validation {
    condition     = var.kubernetes.monitoring_pool.memory >= 1
    error_message = "RAM must be greater than or equal to 1."
  }
}
