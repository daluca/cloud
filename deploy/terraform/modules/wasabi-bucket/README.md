# Wasabi S3 bucket module

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| wasabi | >= 4.0, < 5.0 |

## Resources

| Name | Type |
|------|------|
| [wasabi_bucket.bucket](https://registry.terraform.io/providers/thesisedu/wasabi/latest/docs/resources/bucket) | resource |
| [wasabi_bucket_policy.bucket_policy](https://registry.terraform.io/providers/thesisedu/wasabi/latest/docs/resources/bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | Globally unique bucket name for wabasi bucket. | `string` | n/a | yes |
| restrict\_to\_users | Restrict the bucket to a set of users. | `list(string)` | n/a | yes |
| versioning | Enable bucket versioning. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Wasabi S3 bukcet ARN. |
| bucket | Wasabi S3 bucket name. |
| id | Wasabi S3 bucket name. |

<!-- END-TF-DOCS ---->
