variable "openldap_username" {
  description = "OpenLDAP admin username."
  type        = string
  sensitive   = true
}

variable "openldap_password" {
  description = "OpenLDAP admin password."
  type        = string
  sensitive   = true
}

variable "domain_components" {
  description = "OpenLDAP domain component."
  type        = string
  sensitive   = true
}

variable "users" {
  description = "Keycloak users."
  type = list(object({
    username   = string
    first_name = string
    last_name  = string
    email      = string
  }))
  sensitive = true
}
