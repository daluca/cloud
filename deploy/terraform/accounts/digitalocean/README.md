# DigitalOcean account

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| digitalocean | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| digitalocean | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [digitalocean_domain.environment](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/domain) | resource |
| [digitalocean_project.environment](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |
| [digitalocean_project_resources.domains](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project_resources) | resource |
| [digitalocean_vpc.environment](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc) | resource |
| [digitalocean_region.sydney](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain | Domain to host applications. | `string` | n/a | yes |
| environments | Logical stage of development. | `list(string)` | n/a | yes |

<!-- END-TF-DOCS ---->
