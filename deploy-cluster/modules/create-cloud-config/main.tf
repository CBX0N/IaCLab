resource "local_file" "cloud_init_config_files" {
  filename = "${path.module}/files/user_data_${var.cloud_config.name}.yaml"
  content  = templatefile(var.cloud_config.templatefile, {})
  connection {
    type     = "ssh"
    user     = var.cloud_config.ssh_user
    password = var.cloud_config.ssh_password
    host     = var.cloud_config.ssh_host
  }

  provisioner "file" {
    destination = "/var/lib/vz/snippets/user_data_${var.cloud_config.name}.yaml"
    content     = templatefile(var.cloud_config.templatefile, {})
  }
}
