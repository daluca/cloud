variable "github_repository" {
  description = "GitHub repository to use with Flux."
  type        = string
}

variable "flux_version" {
  description = "Version of Flux to deploy into Kubernetes cluster."
  type        = string
  default     = ""
}

variable "environment" {
  description = "Logical stage of deployment."
  type        = string

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be one of ['development', 'staging', 'production']."
  }
}
