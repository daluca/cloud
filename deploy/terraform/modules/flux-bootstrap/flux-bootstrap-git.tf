resource "flux_bootstrap_git" "main" {
  depends_on = [github_repository_deploy_key.flux]

  path     = "clusters/${var.environment}"
  interval = "1m"
  version  = var.flux_version != "" ? var.flux_version : null
}
