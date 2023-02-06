terraform {
  required_version = ">= 1.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "~> 0.23.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    endpoint = "syd1.digitaloceanspaces.com"
    key      = "staging/terraform.tfstate"
    region   = "ap-southeast-2" # Must be a AWS region

    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.staging.endpoint
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.staging.kube_config[0].cluster_ca_certificate)
  token                  = digitalocean_kubernetes_cluster.staging.kube_config[0].token
}

provider "kubectl" {
  host                   = digitalocean_kubernetes_cluster.staging.endpoint
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.staging.kube_config[0].cluster_ca_certificate)
  token                  = digitalocean_kubernetes_cluster.staging.kube_config[0].token
  load_config_file       = false
}
