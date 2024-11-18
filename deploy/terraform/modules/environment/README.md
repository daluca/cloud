# Environment module

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| aws | >= 5.0, < 6.0 |
| cloudflare | >= 4.0, < 5.0 |
| digitalocean | >= 2.0, < 3.0 |
| github | >= 6.0, < 7.0 |
| kubernetes | >= 2.0, < 3.0 |
| random | >= 3.0, < 4.0 |
| time | >= 0.12.0, < 0.13.0 |
| wasabi | >= 4.0, < 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| fluxcd | ../flux-bootstrap | n/a |
| nextcloud\_storage | ../wasabi-bucket | n/a |
| stackgres\_backup | ../wasabi-bucket | n/a |
| velero\_backup | ../wasabi-bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.nextcloud](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_access_key.stackgres](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_access_key.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.nextcloud](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.stackgres](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [cloudflare_api_token.cert_manager](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token) | resource |
| [cloudflare_api_token.external_dns](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token) | resource |
| [cloudflare_record.apex](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [digitalocean_kubernetes_cluster.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_kubernetes_node_pool.big](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool) | resource |
| [digitalocean_kubernetes_node_pool.monitoring](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool) | resource |
| [digitalocean_project_resources.kubernetes_clusters](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project_resources) | resource |
| [kubernetes_secret.cert_manager_cloudflare_api_token](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.cluster_substitutions](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.extrenal_dns_cloudflare_api_token](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.loadbalancer_substitutions](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.nextcloud_wasabi_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.sops](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.stackgres_wasabi_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.velero_wasabi_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [random_id.nextcloud_bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.stackgres_backup_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.velero_backup_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [time_offset.one_year_from_now](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/offset) | resource |
| [time_sleep.wait_5_minutes](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [cloudflare_api_token_permission_groups.all](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/api_token_permission_groups) | data source |
| [cloudflare_zone.domains](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |
| [digitalocean_kubernetes_versions.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_versions) | data source |
| [digitalocean_loadbalancer.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/loadbalancer) | data source |
| [digitalocean_project.environment](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/project) | data source |
| [digitalocean_region.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/region) | data source |
| [digitalocean_sizes.big_worker_pool](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/sizes) | data source |
| [digitalocean_sizes.monitoring_pool](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/sizes) | data source |
| [digitalocean_sizes.worker_pool](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/sizes) | data source |
| [digitalocean_vpc.environment](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/vpc) | data source |
| [github_branch.environment](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/branch) | data source |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudflare | Cloudflare CDN settings. | ```object({ domains = list(string) })``` | n/a | yes |
| digitalocean | DigitalOcean cloud settings. | ```object({ environment = string region = string })``` | n/a | yes |
| flux | Flux bootstrap settings. | ```object({ version = optional(string) age_key = string controllers = optional(object({ helm = optional(bool) notification = optional(bool) image_reflector = optional(bool) image_automation = optional(bool) })) })``` | n/a | yes |
| github | GitHub repository settings. | ```object({ repository = string branch = optional(string) })``` | n/a | yes |
| kubernetes | Kubernetes cluster settings. | ```object({ version = optional(string, "latest") worker_pool = object({ cpu = number memory = number min = optional(number) max = optional(number) auto_scale = optional(bool, false) count = optional(number) }) big_worker_pool = optional(object({ cpu = number memory = number min = optional(number) max = optional(number) auto_scale = optional(bool, false) count = optional(number) })) monitoring_pool = optional(object({ cpu = number memory = number min = optional(number) max = optional(number) auto_scale = optional(bool, false) count = optional(number) })) destroy_associated_resources = optional(bool, false) })``` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| flux\_private\_key | Private key generated for Flux. |
| github\_branch | GitHub repository branch which Flux syncs manifests. |
| github\_repository\_ssh\_url | SSH url for the GitHub repository where Flux syncs manifests. |
| kube\_config | DigitalOcean Kubernets configuration. |

<!-- END-TF-DOCS ---->
