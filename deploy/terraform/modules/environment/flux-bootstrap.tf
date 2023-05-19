module "fluxcd" {
  source = "../flux-bootstrap"

  github_repository = var.github.repository
  environment       = local.environment
  flux_version      = "v2.0.0-rc.3"
}
