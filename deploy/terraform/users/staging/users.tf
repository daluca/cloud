locals {
  users = var.values.users
}

module "staging" {
  source = "../../modules/users"

  keycloak = {
    realm = "staging"
  }

  users = local.users
}
