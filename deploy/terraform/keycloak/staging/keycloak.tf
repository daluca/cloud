module "staging" {
  source = "../../modules/keycloak"

  keycloak = {
    realm = "staging"
    users = var.users
  }

  openldap = {
    domain_components = var.domain_components
    credentials = {
      username = var.openldap_username
      password = var.openldap_password
    }
  }
}
