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

variable "domain" {
  description = "Domain for client applications."
  type        = string
  sensitive   = true
}

variable "domain_components" {
  description = "OpenLDAP domain component."
  type        = string
  sensitive   = true
}

variable "user" {
  description = "Keycloak user settings."
  type = object({
    first_name = string
    last_name  = string
    username   = string
    email      = string
    quota      = optional(string)
  })
}
