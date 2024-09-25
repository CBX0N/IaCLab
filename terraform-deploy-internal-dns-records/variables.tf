# Bind9 Config
variable "dns_a_records" {
  type = map(object({
    addresses = list(string)
    zone      = string
  }))
}

variable "dns_provider_settings" {
  type = object({
    server        = string
    key_name      = optional(string, "tsig-key.")
    key_algorithm = optional(string, "hmac-sha256")
    key_secret    = string
  })
}