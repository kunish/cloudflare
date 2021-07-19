terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }

  backend "remote" {
    organization = "kunish"
    workspaces {
      name = "dns"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

resource "cloudflare_zone" "zone" {
  zone = var.zone_name
}

resource "cloudflare_record" "record" {
  zone_id  = cloudflare_zone.zone.id
  for_each = var.record_map
  type     = each.value.type
  name     = each.value.name
  value    = each.value.value
  proxied  = each.value.proxied
}
