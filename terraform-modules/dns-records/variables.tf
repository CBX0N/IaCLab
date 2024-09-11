variable "dns_a_records" {
  type = map(object({
    addresses = list(string)
    zone      = string
  }))
}