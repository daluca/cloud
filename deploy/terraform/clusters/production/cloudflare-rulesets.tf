resource "cloudflare_ruleset" "primary_waf_rules" {
  kind    = "zone"
  zone_id = data.cloudflare_zone.primary.zone_id
  phase   = "http_request_firewall_custom"
  name    = "WAF rules"

  rules {
    action      = "block"
    description = "Regional block"
    enabled     = true
    expression  = "(ip.geoip.country in {\"RU\" \"CN\" \"BY\" \"KP\"})"
  }
}

resource "cloudflare_ruleset" "secondary_waf_rules" {
  kind    = "zone"
  zone_id = data.cloudflare_zone.secondary.zone_id
  phase   = "http_request_firewall_custom"
  name    = "WAF rules"

  rules {
    action      = "block"
    description = "Regional block"
    enabled     = true
    expression  = "(ip.geoip.country in {\"RU\" \"CN\" \"BY\" \"KP\"})"
  }
}

resource "cloudflare_ruleset" "tertiary_waf_rules" {
  kind    = "zone"
  zone_id = data.cloudflare_zone.tertiary.zone_id
  phase   = "http_request_firewall_custom"
  name    = "WAF rules"

  rules {
    action      = "block"
    description = "Regional block"
    enabled     = true
    expression  = "(ip.geoip.country in {\"RU\" \"CN\" \"BY\" \"KP\"})"
  }
}
