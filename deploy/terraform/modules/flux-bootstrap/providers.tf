terraform {
  required_version = ">= 1.0"

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = "1.0.0-rc.1, 1.0.0-rc.2, 1.0.0-rc.3, 1.0.0-rc.4"
    }

    github = {
      source  = "integrations/github"
      version = ">= 5.0, < 6.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0, < 5.0"
    }
  }
}
