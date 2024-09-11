module "guacamole" {
  source               = "../terraform-modules/guacamole"
  postgresql_data_path = var.postgresql_data_path
  postgresql_password  = var.postgresql_password
}