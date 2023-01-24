data "digitalocean_kubernetes_versions" "stable" {
  version_prefix = "${var.kubernetes_version}."
}

data "digitalocean_sizes" "node_pool" {
  filter {
    key    = "vcpus"
    values = var.kubernetes_nodes.cpus
  }

  filter {
    key    = "memory"
    values = var.kubernetes_nodes.memory
  }

  filter {
    key    = "regions"
    values = [data.digitalocean_region.sydney.slug]
  }

  sort {
    key       = "price_monthly"
    direction = "asc" # Ascending / Cheapest
  }
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name     = "${var.environment}-cluster"
  region   = data.digitalocean_region.sydney.slug
  version  = data.digitalocean_kubernetes_versions.stable.latest_version
  vpc_uuid = digitalocean_vpc.environment.id

  auto_upgrade  = false
  surge_upgrade = true

  node_pool {
    name       = "${var.kubernetes_nodes.name}-pool"
    size       = element(data.digitalocean_sizes.node_pool.sizes, 0).slug
    node_count = var.kubernetes_nodes.count
  }
}

resource "digitalocean_project_resources" "kubernetes_cluster" {
  project = digitalocean_project.environment.id

  resources = [
    digitalocean_kubernetes_cluster.cluster.urn
  ]
}
