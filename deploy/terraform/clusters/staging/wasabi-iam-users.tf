resource "aws_iam_user" "stackgres" {
  name = "stackgres"
}

resource "aws_iam_access_key" "stackgres" {
  user = aws_iam_user.stackgres.id
}
