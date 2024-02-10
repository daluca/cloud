locals {
  users = var.values.users
}

module "production" {
  source = "../../modules/users"

  keycloak = {
    realm = "production"
  }

  users = local.users
}
