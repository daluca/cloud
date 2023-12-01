variable "keycloak" {
  description = "Keycloak realm settings."
  type = object({
    realm  = string
    domain = string
  })
}

variable "openldap" {
  description = "Openldap settings."
  type = object({
    connection_url    = optional(string)
    domain_components = string
    credentials = object({
      username = string
      password = string
    })
  })
}

variable "domains" {
  description = "Additional domain for applications."
  type = object({
    matrix = optional(string)
  })
}
