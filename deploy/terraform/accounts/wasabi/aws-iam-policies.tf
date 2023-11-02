# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "amazon_s3_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "amazon_s3_read_only_access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "administrator_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "wasabi_read_only_access" {
  arn = "arn:aws:iam::aws:policy/WasabiReadOnlyAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "wasabi_write_only_access" {
  arn = "arn:aws:iam::aws:policy/WasabiWriteOnlyAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "wasabi_full_access" {
  arn = "arn:aws:iam::aws:policy/WasabiFullAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "wasabi_administrator_access" {
  arn = "arn:aws:iam::aws:policy/WasabiAdministratorAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "iam_user_change_password" {
  arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "wasabi_view_billing_access" {
  arn = "arn:aws:iam::aws:policy/WasabiViewBillingAccess"
}

# tflint-ignore: terraform_unused_declarations
data "aws_iam_policy" "wasabi_modify_billing_access" {
  arn = "arn:aws:iam::aws:policy/WasabiModifyBillingAccess"
}
