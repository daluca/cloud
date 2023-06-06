output "kube_config" {
  description = "DigitalOcean Kubernets configuration."
  value       = sensitive(digitalocean_kubernetes_cluster.main.kube_config[0])
}

output "flux_private_key" {
  description = "Private key generated for Flux."
  value       = sensitive(module.fluxcd.private_key)
}

output "github_repository_ssh_url" {
  description = "SSH url for the GitHub repository where Flux sync manifests."
  value       = "ssh://${replace(data.github_repository.main.ssh_clone_url, "/:/", "/")}"
}

output "cloudflare_zone_id" {
  description = "Cloudflare domain zone id."
  value       = sensitive(cloudflare_zone.main.id)
}
