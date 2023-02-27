data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "terraform" {
  name = "daluca/cloud"

  expires_on = "2024-02-27T00:00:00Z"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Zone Write"],
    ]
    resources = {
      "com.cloudflare.api.account.zone.*" = "*"
    }
  }
}
