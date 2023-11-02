terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.0, < 3.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0, < 5.0"
    }

    wasabi = {
      source  = "terrabitz/wasabi"
      version = ">= 4.0, < 5.0"
      configuration_aliases = [
        wasabi.backup,
        wasabi.storage
      ]
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0, < 3.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.0, < 2.0"
    }

    github = {
      source  = "integrations/github"
      version = ">= 5.0, < 6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.0, < 4.0"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.0, < 0.10.0"
    }
  }
}
