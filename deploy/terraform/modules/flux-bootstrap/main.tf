terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.3, < 2.0"
    }

    github = {
      source  = "integrations/github"
      version = ">= 6.0, < 7.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0, < 5.0"
    }
  }
}
