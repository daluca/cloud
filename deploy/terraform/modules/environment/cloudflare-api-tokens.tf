data "cloudflare_api_token_permission_groups" "all" {}

resource "time_offset" "one_year_from_now" {
  offset_years = 1
}

resource "cloudflare_api_token" "external_dns" {
  name = "${data.github_repository.main.full_name}/${local.environment}/external-dns"

  expires_on = time_offset.one_year_from_now.rfc3339

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Zone Read"],
    ]
    resources = {
      "com.cloudflare.api.account.zone.${cloudflare_zone.main.id}" = "*"
    }
  }
}

resource "cloudflare_api_token" "cert_manager" {
  name = "${data.github_repository.main.full_name}/${local.environment}/cert-manager"

  expires_on = time_offset.one_year_from_now.rfc3339

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Zone Read"],
    ]
    resources = {
      "com.cloudflare.api.account.zone.${cloudflare_zone.main.id}" = "*"
    }
  }
}
