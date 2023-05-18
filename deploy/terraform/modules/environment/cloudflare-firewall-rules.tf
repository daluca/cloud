resource "cloudflare_filter" "allow_list" {
  count = var.block_external_traffic ? 1 : 0

  zone_id     = cloudflare_zone.main.id
  description = "Filter traffic that is not on the approved IP allow list."
  expression  = "(not ip.src in {${var.cloudflare_ip_allow_list}})"
}

resource "cloudflare_firewall_rule" "allow_list" {
  count = var.block_external_traffic ? 1 : 0

  zone_id     = cloudflare_zone.main.id
  description = "Block traffic"
  filter_id   = cloudflare_filter.allow_list[0].id
  action      = "block"
}
