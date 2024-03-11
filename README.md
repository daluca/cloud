# Cloud

A mono repo for hosting free and open sources software. Using IaC and GitOps to manage everything from the Cloud provider to the application configuration using tools like [Kubernetes](https://kubernetes.io/), [Flux](https://fluxcd.io/), [Terraform/OpenToFu](https://opentofu.org/) and [GitHub Actions](https://github.com/features/actions/).

## Overview

Each directory for the most part governs a different part of the Kubernetes cluster. Using [Kustomizations](https://fluxcd.io/flux/components/kustomize/kustomizations/) to apply manifests as well as set dependencies on other Kustomizations. Additionally overlays are used to alter the base manifests based on which Kubernetes cluster it is being applied too.

## Providers

- [DigitalOcean](https://www.digitalocean.com/) as the Cloud provider
- [Wasabi](https://wasabi.com/) for S3 compatible storage
- [Cloudflare](https://www.cloudflare.com/) as the WAF / DNS
