data "digitalocean_loadbalancer" "staging" {
  depends_on = [digitalocean_kubernetes_cluster.staging]
  name       = lower(digitalocean_project.staging.name)
}
