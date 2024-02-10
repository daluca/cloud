variable "values" {
  description = "Keycloak user settings."
  type = object({
    users = map(object({
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
  })
}
