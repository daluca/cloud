resource "cloudflare_ruleset" "waf_rules" {
  kind    = "zone"
  zone_id = module.production.cloudflare_zone_id
  phase   = "http_request_firewall_custom"
  name    = "WAF rules"

  rules {
    action      = "block"
    description = "Regional block"
    enabled     = true
    expression  = "(ip.geoip.country in {\"RU\" \"CN\" \"BY\" \"KP\"})"
  }
}
