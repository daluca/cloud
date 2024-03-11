terraform-binary := "terraform"

[confirm("Are you sure you want to destroy the staging cluster?")]
destroy:
  {{ terraform-binary }} destroy
