data "digitalocean_kubernetes_versions" "main" {
  version_prefix = "${var.kubernetes_version}."
}

resource "digitalocean_kubernetes_cluster" "main" {
  name     = "${local.environment}-cluster"
  region   = data.digitalocean_region.main.slug
  version  = data.digitalocean_kubernetes_versions.main.latest_version
  vpc_uuid = data.digitalocean_vpc.environment.id

  auto_upgrade  = false
  surge_upgrade = true

  node_pool {
    name       = "worker-pool"
    size       = element(data.digitalocean_sizes.worker_pool.sizes, 0).slug
    auto_scale = true
    min_nodes  = 3
    max_nodes  = 6
  }
}

resource "digitalocean_kubernetes_node_pool" "monitoring" {
  count      = var.kubernetes_monitoring_pool ? 1 : 0
  cluster_id = digitalocean_kubernetes_cluster.main.id

  name       = "monitoring-pool"
  auto_scale = true
  size       = element(data.digitalocean_sizes.monitoring_pool.sizes, 0).slug
  min_nodes  = 1
  max_nodes  = 2

  taint {
    key    = "workloadKind"
    value  = "monitoring"
    effect = "NoSchedule"
  }
}

resource "digitalocean_project_resources" "kubernetes_clusters" {
  project = data.digitalocean_project.environment.id

  resources = [
    digitalocean_kubernetes_cluster.main.urn
  ]
}
