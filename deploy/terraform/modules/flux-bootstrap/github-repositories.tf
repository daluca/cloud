data "github_repository" "main" {
  name = var.github_repository
}

resource "github_repository_deploy_key" "flux" {
  title      = "${var.environment}-cluster"
  repository = data.github_repository.main.name
  key        = tls_private_key.flux.public_key_openssh
  read_only  = false
}
