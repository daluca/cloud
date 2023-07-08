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
