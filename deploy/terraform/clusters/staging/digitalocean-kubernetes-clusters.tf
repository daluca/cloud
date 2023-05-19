data "digitalocean_kubernetes_versions" "stable" {
  version_prefix = "${var.kubernetes_version}."
}

resource "digitalocean_kubernetes_cluster" "staging" {
  name     = "${lower(data.digitalocean_project.staging.name)}-cluster"
  region   = data.digitalocean_region.sydney.slug
  version  = data.digitalocean_kubernetes_versions.stable.latest_version
  vpc_uuid = data.digitalocean_vpc.staging.id

  #tfsec:ignore:digitalocean-compute-kubernetes-auto-upgrades-not-enabled:exp:2023-09-01
  auto_upgrade = false
  #tfsec:ignore:digitalocean-compute-surge-upgrades-not-enabled:exp:2023-09-01
  surge_upgrade = false

  node_pool {
    name       = "worker-pool"
    size       = "s-4vcpu-8gb"
    node_count = var.kubernetes_node_count
  }
}

resource "digitalocean_kubernetes_node_pool" "monitoring" {
  cluster_id = digitalocean_kubernetes_cluster.staging.id

  name       = "monitoring-pool"
  size       = "s-2vcpu-4gb"
  node_count = 1

  taint {
    key    = "workloadKind"
    value  = "monitoring"
    effect = "NoSchedule"
  }
}

resource "digitalocean_project_resources" "kubernetes_clusters" {
  project = data.digitalocean_project.staging.id

  resources = [
    digitalocean_kubernetes_cluster.staging.urn
  ]
}
