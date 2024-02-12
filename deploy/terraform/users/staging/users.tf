module "staging" {
  source = "../../modules/users"

  keycloak = {
    realm = "staging"
  }

  users = var.users
}
