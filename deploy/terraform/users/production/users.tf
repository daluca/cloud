module "production" {
  source = "../../modules/users"

  keycloak = {
    realm = "production"
  }

  users = var.users
}
