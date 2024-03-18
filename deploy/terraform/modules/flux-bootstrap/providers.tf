terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.0, < 2.0"
    }

    github = {
      source  = "integrations/github"
      version = ">= 5.0, < 7.0, != 5.26.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0, < 5.0"
    }
  }
}
