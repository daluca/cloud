terraform-binary := "terraform"

[no-cd]
init:
  {{ terraform-binary }} init -backend-config=bucket="${TERRAFORM_STATE_BUCKET}" -backend-config=access_key="${AWS_ACCESS_KEY_ID}" -backend-config=secret_key="${AWS_SECRET_ACCESS_KEY}"

[no-cd]
plan:
  {{ terraform-binary }} plan

[no-cd]
apply:
  {{ terraform-binary }} apply
