variable "keycloak" {
  description = "Keycloak realm settings."
  type = object({
    realm = string
  })
}

variable "users" {
  description = "Keycloak user settings."
  type = map(object({
    username   = string
    first_name = string
    last_name  = string
    email = object({
      address  = string
      verified = optional(bool)
    })
    quota  = optional(string)
    groups = optional(list(string))
  }))
}
