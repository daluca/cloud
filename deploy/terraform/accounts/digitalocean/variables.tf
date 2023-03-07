variable "environments" {
  description = "Logical stage of development."
  type        = list(string)

  validation {
    condition = alltrue(
      [for env in var.environments : contains(["development", "staging", "production"], env)]
    )
    error_message = "Environments must only contain ['development', 'staging', 'production']."
  }
}

variable "domain" {
  description = "Domain to host applications."
  type        = string
  sensitive   = true
}
