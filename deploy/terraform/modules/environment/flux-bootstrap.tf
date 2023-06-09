locals {
  default_flux_controllers = {
    helm             = null
    notification     = null
    image_reflector  = null
    image_automation = null
  }
}

module "fluxcd" {
  source = "../flux-bootstrap"

  github_repository = var.github.repository
  environment       = local.environment
  flux_version      = var.flux.version != null ? var.flux.version : "latest"
  controllers       = var.flux.controllers != null ? var.flux.controllers : local.default_flux_controllers
}
