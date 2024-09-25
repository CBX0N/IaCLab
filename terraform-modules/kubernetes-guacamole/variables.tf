variable "postgresql_password" {
  type      = string
  sensitive = true
}
variable "postgresql_data_path" {
  type    = string
  default = "/var/lib/postgresql/"
}