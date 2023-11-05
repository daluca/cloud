terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }

    wasabi = {
      source  = "thesisedu/wasabi"
      version = "~> 4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "~> 1.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.9.0"
    }
  }

  backend "s3" {
    endpoint = "s3.ap-southeast-2.wasabisys.com"
    key      = "clusters/production/terraform.tfstate"
    region   = "ap-southeast-2"
    encrypt  = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

provider "flux" {
  kubernetes = {
    host                   = module.production.kube_config.host
    cluster_ca_certificate = base64decode(module.production.kube_config.cluster_ca_certificate)
    token                  = module.production.kube_config.token
  }

  git = {
    url    = module.production.github_repository_ssh_url
    branch = module.production.github_branch
    ssh = {
      username    = "git"
      private_key = module.production.flux_private_key.private_key_pem
    }
  }
}

provider "kubernetes" {
  host                   = module.production.kube_config.host
  cluster_ca_certificate = base64decode(module.production.kube_config.cluster_ca_certificate)
  token                  = module.production.kube_config.token
}

provider "wasabi" {
  alias  = "netherlands"
  region = "eu-central-1"
}

provider "wasabi" {
  alias  = "sydney"
  region = "ap-southeast-2"
}

provider "aws" {
  region = "us-east-1"

  s3_use_path_style           = true
  skip_region_validation      = true
  skip_credentials_validation = true

  endpoints {
    sts = "https://sts.wasabisys.com"
    iam = "https://iam.wasabisys.com"
    s3  = "https://s3.wasabisys.com"
  }
}
