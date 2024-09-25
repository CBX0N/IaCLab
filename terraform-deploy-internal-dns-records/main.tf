module "bind9_records" {
  source                = "../terraform-modules/dns-records"
  dns_a_records         = var.dns_a_records
  dns_provider_settings = var.dns_provider_settings
}