terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 4.0, < 5.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0, < 3.0"
    }
  }
}
