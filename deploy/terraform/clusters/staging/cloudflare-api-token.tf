data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "external_dns" {
  name = "daluca/cloud/external-dns"

  expires_on = "2024-02-27T00:00:00Z"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Zone Read"],
    ]
    resources = {
      "com.cloudflare.api.account.zone.${cloudflare_zone.tertiary_domain.id}" = "*"
    }
  }
}
