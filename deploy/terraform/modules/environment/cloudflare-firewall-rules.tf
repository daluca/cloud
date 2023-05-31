resource "cloudflare_ruleset" "allow_list" {
  count = var.cloudflare.block_external_traffic ? 1 : 0

  kind        = "zone"
  zone_id     = sensitive(cloudflare_zone.main.id)
  phase       = "http_request_firewall_custom"
  name        = "Allowlist"
  description = "Block traffic that is not on the approved IP allow list."

  rules {
    action      = "block"
    description = "Block traffic"
    enabled     = true
    expression  = "(not ip.src in {${sensitive(var.cloudflare.allow_list)}})"
  }
}
