module "staging" {
  source = "../../modules/keycloak"

  keycloak = {
    realm  = "staging"
    domain = var.domain
  }

  openldap = {
    domain_components = var.domain_components
    credentials = {
      username = var.openldap_username
      password = var.openldap_password
    }
  }

  domains = {}
}
