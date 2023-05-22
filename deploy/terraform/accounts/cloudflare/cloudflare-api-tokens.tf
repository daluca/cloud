data "cloudflare_api_token_permission_groups" "all" {}

resource "time_offset" "one_year_from_now" {
  offset_years = 1
}

resource "cloudflare_api_token" "terraform" {
  name = "daluca/cloud"

  expires_on = time_offset.one_year_from_now.base_rfc3339

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Zone Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Zone Settings Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Firewall Services Write"],
    ]
    resources = {
      "com.cloudflare.api.account.zone.*" = "*"
    }
  }

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Account API Tokens Write"],
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.user["API Tokens Write"],
    ]
    resources = {
      "com.cloudflare.api.user.${var.cloudflare_user_id}" = "*"
    }
  }
}
