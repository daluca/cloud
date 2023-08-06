data "digitalocean_kubernetes_versions" "main" {
  version_prefix = var.kubernetes.version != "latest" ? "${var.kubernetes.version}." : null
}

resource "digitalocean_kubernetes_cluster" "main" {
  name     = "${local.environment}-cluster"
  region   = data.digitalocean_region.main.slug
  version  = data.digitalocean_kubernetes_versions.main.latest_version
  vpc_uuid = data.digitalocean_vpc.environment.id

  # tfsec:ignore:digitalocean-compute-surge-upgrades-not-enabled
  surge_upgrade = false
  auto_upgrade  = true

  destroy_all_associated_resources = var.kubernetes.destroy_associated_resources

  node_pool {
    name       = "worker-pool"
    size       = element(data.digitalocean_sizes.worker_pool.sizes, 0).slug
    auto_scale = var.kubernetes.worker_pool.auto_scale
    min_nodes  = var.kubernetes.worker_pool.auto_scale ? var.kubernetes.worker_pool.min : null
    max_nodes  = var.kubernetes.worker_pool.auto_scale ? var.kubernetes.worker_pool.max : null
    node_count = !var.kubernetes.worker_pool.auto_scale ? var.kubernetes.worker_pool.count != null ? var.kubernetes.worker_pool.count : 2 : null
  }
}

resource "digitalocean_kubernetes_node_pool" "monitoring" {
  count      = var.kubernetes.monitoring_pool != null ? 1 : 0
  cluster_id = digitalocean_kubernetes_cluster.main.id

  name       = "monitoring-pool"
  size       = element(data.digitalocean_sizes.monitoring_pool[0].sizes, 0).slug
  auto_scale = var.kubernetes.monitoring_pool.auto_scale
  min_nodes  = var.kubernetes.monitoring_pool.auto_scale ? var.kubernetes.monitoring_pool.min : null
  max_nodes  = var.kubernetes.monitoring_pool.auto_scale ? var.kubernetes.monitoring_pool.max : null
  node_count = !var.kubernetes.monitoring_pool.auto_scale ? var.kubernetes.monitoring_pool.count != null ? var.kubernetes.monitoring_pool.count : 1 : null

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
