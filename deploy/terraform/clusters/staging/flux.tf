locals {
  ssh_clone_url = replace(data.github_repository.flux.ssh_clone_url, "/:/", "/")
}

data "flux_install" "staging" {
  target_path = "clusters/${lower(var.environment)}"
  version     = "v${var.flux_version}"
}

data "flux_sync" "staging" {
  target_path = "clusters/${lower(var.environment)}"
  url         = "ssh://${local.ssh_clone_url}"
  branch      = "main"
}
