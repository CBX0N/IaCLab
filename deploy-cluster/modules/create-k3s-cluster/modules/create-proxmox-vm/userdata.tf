resource "local_file" "cluster_userdata" {
  filename = "${path.module}/files/user_data_${var.vm_config.name}.yaml"
  content  = var.userdata_content
  connection {
    type     = "ssh"
    user     = var.proxmox_ssh_config.ssh_user
    password = var.proxmox_ssh_config.ssh_password
    host     = var.proxmox_ssh_config.ssh_host
  }
  provisioner "file" {
    destination = "/var/lib/vz/snippets/user_data_${var.vm_config.name}.yaml"
    content     = var.userdata_content
  }
}