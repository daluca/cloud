resource "cloudflare_firewall_rule" "allow_list" {
  zone_id     = cloudflare_zone.tertiary_domain.id
  description = "Block traffic"
  filter_id   = cloudflare_filter.allow_list.id
  action      = "block"
}

resource "cloudflare_filter" "allow_list" {
  zone_id     = cloudflare_zone.tertiary_domain.id
  description = "Filter traffic outside of worker nodes and staging approved IP allow list."
  expression  = "(not ip.src in {${var.cloudflare_ip_allow_list}})"
}
