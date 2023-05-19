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

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    wasabi = {
      source  = "terrabitz/wasabi"
      version = ">= 4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }

    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.0"
    }
  }

  backend "s3" {
    endpoint = "s3.ap-southeast-2.wasabisys.com"
    key      = "clusters/staging/terraform.tfstate"
    region   = "ap-southeast-2"
    encrypt  = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    force_path_style            = true
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

provider "wasabi" {
  region = "eu-central-1"
}

provider "wasabi" {
  alias  = "sydney"
  region = "ap-southeast-2"
}

provider "aws" {
  region = "eu-central-1"

  s3_use_path_style           = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    sts = "https://sts.eu-central-1.wasabisys.com"
    iam = "https://iam.eu-central-1.wasabisys.com"
    s3  = "https://s3.eu-central-1.wasabisys.com"
  }
}

provider "aws" {
  alias  = "sydney"
  region = "ap-southeast-2"

  s3_use_path_style           = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    sts = "https://sts.ap-southeast-2.wasabisys.com"
    iam = "https://iam.ap-southeast-2.wasabisys.com"
    s3  = "https://s3.ap-southeast-2.wasabisys.com"
  }
}

provider "openstack" {
  region   = var.catalyst_cloud_region
  auth_url = local.auth_url
}
