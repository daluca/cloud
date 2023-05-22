variable "github_repository" {
  description = "GitHub repository to use with Flux."
  type        = string
}

variable "flux_version" {
  description = "Version of Flux to deploy into Kubernetes cluster."
  type        = string
  default     = "latest"

  validation {
    condition     = can(regex("^latest|v[0-9]{1,}\\.[0-9]{1,}\\.[0-9]{1,}(-rc\\.[0-9]{1,})?$", var.flux_version))
    error_message = "Version must follow semantic version e.g. v2.0.1"
  }
}

variable "environment" {
  description = "Logical stage of deployment."
  type        = string

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be one of ['development', 'staging', 'production']."
  }
}
