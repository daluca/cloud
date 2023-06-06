resource "cloudflare_ruleset" "waf_rules" {
  kind    = "zone"
  zone_id = module.staging.cloudflare_zone_id
  phase   = "http_request_firewall_custom"
  name    = "WAF rules"

  rules {
    action      = "block"
    description = "Allowlist traffic"
    enabled     = false
    expression  = "(not ip.src in {${sensitive(var.cloudflare_allowlist)}})"
  }

  rules {
    action      = "block"
    description = "Regional block"
    enabled     = true
    expression  = "(not ip.geoip.country in {\"AU\" \"NZ\"})"
  }
}
