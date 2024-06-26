locals {
  components = flatten(["source-controller", "kustomize-controller",
    var.controllers.helm == null ? ["helm-controller"] : var.controllers.helm ? ["helm-controller"] : [],
    var.controllers.notification == null ? ["notification-controller"] : var.controllers.notification ? ["notification-controller"] : []
  ])

  extra_components = flatten([
    var.controllers.image_reflector == null ? [] : var.controllers.image_reflector ? ["image-reflector-controller"] : [],
    var.controllers.image_automation == null ? [] : var.controllers.image_automation ? ["image-automation-controller"] : []
  ])
}

resource "flux_bootstrap_git" "main" {
  depends_on = [github_repository_deploy_key.flux]

  components       = local.components
  components_extra = local.extra_components
  path             = "clusters/${var.environment}"
  interval         = "1m"
  version          = var.flux_version != "latest" ? "v${var.flux_version}" : null

  delete_git_manifests = false
}
