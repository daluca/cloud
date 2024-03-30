terraform {
  required_version = ">= 1.0, < 1.6"

  required_providers {
    wasabi = {
      source  = "thesisedu/wasabi"
      version = ">= 4.0, < 5.0"
    }
  }
}
