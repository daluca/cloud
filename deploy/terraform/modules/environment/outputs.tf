output "kube_config" {
  description = "DigitalOcean Kubernets configuration."
  value       = sensitive(digitalocean_kubernetes_cluster.main.kube_config[0])
  sensitive   = true
}

output "flux_private_key" {
  description = "Private key generated for Flux."
  value       = sensitive(module.fluxcd.private_key)
  sensitive   = true
}

output "github_repository_ssh_url" {
  description = "SSH url for the GitHub repository where Flux syncs manifests."
  value       = "ssh://${replace(data.github_repository.main.ssh_clone_url, "/:/", "/")}"
}

output "github_branch" {
  description = "GitHub repository branch which Flux syncs manifests."
  value       = data.github_branch.environment.branch
}
