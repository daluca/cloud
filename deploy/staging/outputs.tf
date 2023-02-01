output "region" {
  value = data.digitalocean_region.sydney.slug
}

output "project" {
  value = digitalocean_project.staging.name
}

output "kubernetes_version" {
  value = data.digitalocean_kubernetes_versions.stable.latest_version
}

output "github_repository" {
  value = data.github_repository.flux
}

output "kubernetes_cluster" {
  value     = digitalocean_kubernetes_cluster.staging
  sensitive = true
}

output "flux_git_clone_url" {
  value = data.flux_sync.staging.url
}
