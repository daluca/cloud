terraform {
  required_version = ">= 1.0"

  required_providers {
    wasabi = {
      source  = "terrabitz/wasabi"
      version = ">= 4.0, < 5.0"
    }
  }
}
