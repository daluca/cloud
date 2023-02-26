resource "random_password" "account_alias" {
  length           = 36
  upper            = false
  override_special = "-"
}

resource "wasabi_account_alias" "main" {
  account_alias = random_password.account_alias.result
}
