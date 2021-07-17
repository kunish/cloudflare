variable "cloudflare_email" {
  type = string
}

variable "cloudflare_api_key" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "record_map" {
  type = map(object({
    name    = string
    value   = string
    type    = string
    proxied = bool
  }))
}
