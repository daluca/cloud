module "staging" {
  source = "../../modules/environment"

  providers = {
    wasabi.storage = wasabi.sydney
    wasabi.backup  = wasabi.netherlands
  }

  environment         = var.environment
  digitalocean_region = var.digitalocean_region

  kubernetes_version           = "1.26"
  kubernetes_worker_cpu        = 4
  kubernetes_worker_memory     = 8
  kubernetes_monitoring_pool   = true
  kubernetes_monitoring_cpu    = 2
  kubernetes_monitoring_memory = 4

  domain                   = var.domain
  cloudflare_account_name  = var.cloudflare_account_name
  cloudflare_ip_allow_list = var.cloudflare_ip_allow_list

  github_repository = "cloud"
}
