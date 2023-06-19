variable "keycloak" {
  description = "Keycloak realm settings."
  type = object({
    realm = string
    users = list(object({
      username   = string
      first_name = string
      last_name  = string
      email      = string
    }))
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
