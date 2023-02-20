resource "aws_iam_user" "terraform" {
  name = "terraform"
}

resource "aws_iam_access_key" "terraform" {
  user = aws_iam_user.terraform.id
}

resource "aws_iam_user_policy_attachment" "wasabi_full_access" {
  user       = aws_iam_user.terraform.id
  policy_arn = data.aws_iam_policy.wasabi_full_access.arn
}

resource "aws_iam_user" "read_only" {
  name = "read-only"
}

resource "aws_iam_user_policy_attachment" "read_only" {
  user       = aws_iam_user.read_only.id
  policy_arn = data.aws_iam_policy.wasabi_read_only_access.arn
}

resource "aws_iam_user_policy_attachment" "iam_user_change_password" {
  user       = aws_iam_user.read_only.id
  policy_arn = data.aws_iam_policy.iam_user_change_password.arn
}
