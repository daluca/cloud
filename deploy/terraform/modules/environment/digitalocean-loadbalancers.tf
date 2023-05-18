resource "time_sleep" "wait_5_minutes" {
  depends_on = [module.fluxcd]

  create_duration = "5m"
}

data "digitalocean_loadbalancer" "main" {
  depends_on = [time_sleep.wait_5_minutes]
  name       = local.environment
}
