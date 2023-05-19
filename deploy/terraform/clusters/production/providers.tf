terraform {
  required_version = ">= 1.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.0"
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

provider "openstack" {
  region   = var.catalyst_cloud_region
  auth_url = local.auth_url
}
