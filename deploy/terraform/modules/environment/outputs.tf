output "kube_config" {
  description = "DigitalOcean Kubernets configuration."
  value       = digitalocean_kubernetes_cluster.main.kube_config[0]
}

output "flux_private_key" {
  description = "Private key generate for Flux."
  value       = module.fluxcd.private_key
}
