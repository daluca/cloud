data "digitalocean_sizes" "worker_pool" {
  filter {
    key    = "vcpus"
    values = [var.kubernetes_worker_cpu]
  }

  filter {
    key    = "memory"
    values = [tostring(var.kubernetes_worker_memory * 1024)]
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
  filter {
    key    = "vcpus"
    values = [var.kubernetes_monitoring_cpu]
  }

  filter {
    key    = "memory"
    values = [tostring(var.kubernetes_monitoring_memory * 1024)]
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
