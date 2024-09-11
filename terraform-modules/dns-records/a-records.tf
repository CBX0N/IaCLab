resource "dns_a_record_set" "dns_record" {
  for_each  = var.dns_a_records
  addresses = each.value.addresses
  zone      = each.value.zone
  name      = each.key
}