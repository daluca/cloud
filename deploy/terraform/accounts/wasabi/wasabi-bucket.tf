resource "random_id" "terraform_state_suffix" {
  byte_length = 8
}

module "terraform_state" {
  source = "../../modules/wasabi-bucket"

  providers = {
    wasabi = wasabi.sydney
  }

  bucket            = sensitive("terraform-state-${random_id.terraform_state_suffix.hex}")
  restrict_to_users = [sensitive(aws_iam_user.terraform.arn)]
  versioning        = true
}
