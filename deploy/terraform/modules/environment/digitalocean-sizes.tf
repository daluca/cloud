data "digitalocean_sizes" "worker_pool" {
  filter {
    key    = "vcpus"
    values = [var.kubernetes.worker_pool.cpu]
  }

  filter {
    key    = "memory"
    values = [tostring(var.kubernetes.worker_pool.memory * 1024)]
  }

  filter {
    key    = "regions"
    values = [data.digitalocean_region.main.slug]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}

data "digitalocean_sizes" "memory_worker_pool" {
  count = var.kubernetes.memory_worker_pool != null ? 1 : 0

  filter {
    key    = "vcpus"
    values = [var.kubernetes.memory_worker_pool.cpu]
  }

  filter {
    key    = "memory"
    values = [tostring(var.kubernetes.memory_worker_pool.memory * 1024)]
  }

  filter {
    key    = "regions"
    values = [data.digitalocean_region.main.slug]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}

data "digitalocean_sizes" "monitoring_pool" {
  count = var.kubernetes.monitoring_pool != null ? 1 : 0

  filter {
    key    = "vcpus"
    values = [var.kubernetes.monitoring_pool.cpu]
  }

  filter {
    key    = "memory"
    values = [tostring(var.kubernetes.monitoring_pool.memory * 1024)]
  }

  filter {
    key    = "regions"
    values = [data.digitalocean_region.main.slug]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}
