variable "github" {
  description = "GitHub repository settings."
  type = object({
    repository = string
  })
}

variable "flux" {
  description = "Flux bootstrap settings."
  type = object({
    version = optional(string)
    age_key = string
    controllers = optional(object({
      helm             = optional(bool)
      notification     = optional(bool)
      image_reflector  = optional(bool)
      image_automation = optional(bool)
    }))
  })

  validation {
    condition     = can(regex("^v[0-9]{1,}\\.[0-9]{1,}\\.[0-9]{1,}(-rc\\.[0-9]{1,})?$", var.flux.version)) || var.flux.version == null
    error_message = "Version must follow semantic version e.g. v2.0.1"
  }
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
    domains = list(string)
  })
}

variable "kubernetes" {
  description = "Kubernetes cluster settings."
  type = object({
    version = optional(string, "latest")
    worker_pool = object({
      cpu        = number
      memory     = number
      min        = optional(number)
      max        = optional(number)
      auto_scale = optional(bool, false)
      count      = optional(number)
    })
    monitoring_pool = optional(object({
      cpu        = number
      memory     = number
      min        = optional(number)
      max        = optional(number)
      auto_scale = optional(bool, false)
      count      = optional(number)
    }))
  })

  validation {
    condition     = contains(["1.24", "1.25", "1.26", "latest"], var.kubernetes.version)
    error_message = "Kubernetes version must be one of ['1.24', '1.25', '1.26', 'latest']."
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
    condition     = var.kubernetes.monitoring_pool != null ? var.kubernetes.monitoring_pool.cpu >= 1 : true
    error_message = "CPU count must be greater than or equal to 1."
  }

  validation {
    condition     = var.kubernetes.monitoring_pool != null ? var.kubernetes.monitoring_pool.memory >= 1 : true
    error_message = "RAM must be greater than or equal to 1."
  }
}
