data "digitalocean_loadbalancer" "staging" {
  depends_on = [digitalocean_kubernetes_cluster.staging]
  name       = lower(data.digitalocean_project.staging.name)
}
