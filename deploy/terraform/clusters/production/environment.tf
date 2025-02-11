module "production" {
  source = "../../modules/environment"

  providers = {
    wasabi.storage = wasabi.sydney
    wasabi.backup  = wasabi.netherlands
  }

  digitalocean = {
    environment = "production"
    region      = "syd1"
  }

  kubernetes = {
    version = "1.31"
    worker_pool = {
      cpu        = 4
      memory     = 8
      auto_scale = true
      min        = 1
      max        = 2
    }
    big_worker_pool = {
      cpu        = 8
      memory     = 16
      auto_scale = false
      count      = 2
    }
    monitoring_pool = {
      cpu        = 2
      memory     = 4
      auto_scale = false
      count      = 1
    }
  }

  cloudflare = {
    domains = [
      var.primary_domain,
      var.secondary_domain,
    ]
  }

  github = {
    repository = "cloud"
  }

  flux = {
    version = "2.4.0"
    age_key = base64decode(var.flux_age_key)
  }
}
