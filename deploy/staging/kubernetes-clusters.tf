data "digitalocean_kubernetes_versions" "stable" {
  version_prefix = "${var.kubernetes_version}."
}

resource "digitalocean_kubernetes_cluster" "staging" {
  # depends_on = [time_sleep.wait_2_minutes]

  name     = "${lower(digitalocean_project.staging.name)}-cluster"
  region   = data.digitalocean_region.sydney.slug
  version  = data.digitalocean_kubernetes_versions.stable.latest_version
  vpc_uuid = digitalocean_vpc.staging.id

  auto_upgrade  = false
  surge_upgrade = false

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = var.kubernetes_node_count
  }
}

resource "digitalocean_project_resources" "kubernetes_clusters" {
  project = digitalocean_project.staging.id

  resources = [
    digitalocean_kubernetes_cluster.staging.urn
  ]
}
