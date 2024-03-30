# Wasabi account

<!-- BEGIN-TF-DOCS -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0, < 1.6 |
| aws | ~> 4.0 |
| random | ~> 3.0 |
| wasabi | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| terraform\_state | ../../modules/wasabi-bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.minio_client](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_access_key.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.minio_client](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.minio_client_wasabi_full_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.read_only_iam_user_change_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.read_only_read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.terraform_wasabi_full_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [random_id.terraform_state_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.account_alias](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [wasabi_account_alias.main](https://registry.terraform.io/providers/thesisedu/wasabi/latest/docs/resources/account_alias) | resource |
| [aws_iam_policy.administrator_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.amazon_s3_full_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.amazon_s3_read_only_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.iam_user_change_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.wasabi_administrator_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.wasabi_full_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.wasabi_modify_billing_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.wasabi_read_only_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.wasabi_view_billing_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.wasabi_write_only_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Outputs

| Name | Description |
|------|-------------|
| minio\_client\_access\_key | Wasabi access key for minio-client user. |
| minio\_client\_secret\_key | Wasabi secret key for minio-client user. |
| terraform\_access\_key | Wasabi access key for terraform user. |
| terraform\_secret\_key | Wasabi secret key for terraform user. |
| wasabi\_account\_alias | Wasabi account alias. |

<!-- END-TF-DOCS ---->
