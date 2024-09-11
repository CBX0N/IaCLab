# Bind9 Config
variable "bind9_key_secret" {
  type = string
}

variable "bind9_ip" {
  type = string
}

variable "dns_a_records" {
  type = map(object({
    addresses = list(string)
    zone      = string
  }))
}
