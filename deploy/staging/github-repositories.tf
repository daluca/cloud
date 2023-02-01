data "github_repository" "flux" {
  name = "cloud-testing"
}

resource "github_repository_deploy_key" "flux" {
  title      = "${lower(var.environment)}-cluster"
  repository = data.github_repository.flux.id
  key        = tls_private_key.flux.public_key_openssh
  read_only  = true
}

resource "github_repository_file" "flux_install" {
  repository = data.github_repository.flux.name
  file       = data.flux_install.staging.path
  content    = data.flux_install.staging.content
  branch     = "main"
}

resource "github_repository_file" "flux_sync" {
  repository = data.github_repository.flux.name
  file       = data.flux_sync.staging.path
  content    = data.flux_sync.staging.content
  branch     = "main"
}
