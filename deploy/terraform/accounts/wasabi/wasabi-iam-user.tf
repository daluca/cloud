resource "aws_iam_user" "terraform" {
  name = "terraform"
}

resource "aws_iam_access_key" "terraform" {
  user = aws_iam_user.terraform.id
}

resource "aws_iam_user_policy_attachment" "terraform_wasabi_full_access" {
  user       = aws_iam_user.terraform.id
  policy_arn = data.aws_iam_policy.administrator_access.arn
}

resource "aws_iam_user" "read_only" {
  name = "read-only"
}

resource "aws_iam_user_policy_attachment" "read_only_read_only" {
  user       = aws_iam_user.read_only.id
  policy_arn = data.aws_iam_policy.wasabi_read_only_access.arn
}

resource "aws_iam_user_policy_attachment" "read_only_iam_user_change_password" {
  user       = aws_iam_user.read_only.id
  policy_arn = data.aws_iam_policy.iam_user_change_password.arn
}

resource "aws_iam_user" "minio_client" {
  name = "minio-client"
}

resource "aws_iam_access_key" "minio_client" {
  user = aws_iam_user.minio_client.id
}

resource "aws_iam_user_policy_attachment" "minio_client_wasabi_full_access" {
  user       = aws_iam_user.minio_client.id
  policy_arn = data.aws_iam_policy.amazon_s3_full_access.arn
}
