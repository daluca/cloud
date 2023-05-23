module "staging" {
  source = "../../modules/environment"

  providers = {
    wasabi.storage = wasabi.sydney
    wasabi.backup  = wasabi.netherlands
  }

  digitalocean = {
    environment = "staging"
    region      = "syd1"
  }

  kubernetes = {
    version = "1.25"
    worker_pool = {
      cpu        = 4
      memory     = 8
      auto_scale = true
      min        = 3
      max        = 5
    }
    monitoring_pool = {
      cpu        = 2
      memory     = 4
      auto_scale = true
      min        = 1
      max        = 2
    }
  }

  cloudflare = {
    account_id             = var.cloudflare_account_id
    domain                 = var.cloudflare_domain
    allow_list             = var.cloudflare_ip_allow_list
    block_external_traffic = true
  }

  github = {
    repository = "cloud"
  }

  flux = {
    version = "v2.0.0-rc.3"
    age_key = base64decode(var.flux_age_key)
  }
}
