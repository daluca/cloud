# Flux bootstrap module

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| flux | >= 1.0, < 2.0 |
| github | >= 6.0, < 7.0 |
| tls | >= 4.0, < 5.0 |

## Resources

| Name | Type |
|------|------|
| [flux_bootstrap_git.main](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/resources/bootstrap_git) | resource |
| [github_repository_deploy_key.flux](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) | resource |
| [tls_private_key.flux](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| controllers | Flux controllers to enable. | ```object({ helm = optional(bool) notification = optional(bool) image_reflector = optional(bool) image_automation = optional(bool) })``` | ```{ "helm": true, "image_automation": false, "image_reflector": false, "notification": true }``` | no |
| environment | Logical stage of deployment. | `string` | n/a | yes |
| flux\_version | Version of Flux to deploy into Kubernetes cluster. | `string` | `"latest"` | no |
| github\_repository | GitHub repository to use with Flux. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_key | Flux private key. |

<!-- END-TF-DOCS ---->
