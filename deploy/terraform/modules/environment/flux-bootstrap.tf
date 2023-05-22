module "fluxcd" {
  source = "../flux-bootstrap"

  github_repository = var.github.repository
  environment       = local.environment
  flux_version      = var.flux.version != null ? var.flux.version : "latest"
}
