locals {
  ssh_clone_url = replace(data.github_repository.flux.ssh_clone_url, "/:/", "/")
}

data "flux_install" "staging" {
  target_path = "clusters/${lower(digitalocean_project.staging.name)}"
  version     = "v${var.flux_version}"
}

data "flux_sync" "staging" {
  target_path = "clusters/${lower(digitalocean_project.staging.name)}"
  url         = "ssh://${local.ssh_clone_url}"
  branch      = "main"
}
