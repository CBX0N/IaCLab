resource "local_file" "cloud_init_config_files" {
  count    = var.vm_config.cloudinit.templatefile != null ? 1 : 0
  filename = "${path.module}/files/user_data_${var.vm_config.name}.yml"
  content  = templatefile(var.vm_config.cloudinit.templatefile, {hostname = var.vm_config.name})
  connection {
    type     = "ssh"
    user     = var.proxmox_provider_settings.ssh_user
    password = var.proxmox_provider_settings.ssh_password
    host     = var.proxmox_provider_settings.ssh_host
  }

  provisioner "file" {
    destination = "/var/lib/vz/snippets/user_data_${var.vm_config.name}.yml"
    content     = templatefile(var.vm_config.cloudinit.templatefile, {hostname = var.vm_config.name})
  }
}

resource "proxmox_vm_qemu" "vm" {
  depends_on = [
    local_file.cloud_init_config_files,
  ]
  name        = var.vm_config.name
  boot        = var.vm_config.boot_order
  desc        = var.vm_config.desc
  target_node = var.vm_config.target_node != null ? var.vm_config.target_node : var.default_vm_config.target_node
  clone       = var.vm_config.vm_template_name
  vm_state    = var.vm_config.vm_state
  full_clone  = true
  agent       = var.vm_config.qemu_agent
  cores       = var.vm_config.cores != null ? var.vm_config.cores : var.default_vm_config.cores
  memory      = var.vm_config.memory != null ? var.vm_config.memory : var.default_vm_config.memory
  balloon     = var.vm_config.balloon_min
  skip_ipv6   = true
  network {
    bridge   = var.vm_config.network != null ? var.vm_config.network.bridge : var.default_vm_config.network_bridge
    firewall = var.vm_config.network != null ? var.vm_config.network.firewall : var.default_vm_config.network_adapter_firewall
    model    = var.vm_config.network != null ? var.vm_config.network.model : var.default_vm_config.network_adapter_model
  }
  lifecycle {
    ignore_changes = [disks]
  }
  ciuser                 = var.vm_config.cloudinit != null ? var.vm_config.cloudinit.ciuser : null
  cipassword             = var.vm_config.cloudinit != null ? var.vm_config.cloudinit.cipassword : null
  cicustom               = var.vm_config.cloudinit.templatefile != null ? "user=local:snippets/user_data_${var.vm_config.name}.yml" : null
  ipconfig0              = var.vm_config.cloudinit != null ? "ip=${var.vm_config.cloudinit.ipconfig.ip},gw=${var.vm_config.cloudinit.ipconfig.gateway}" : null
  searchdomain           = var.vm_config.cloudinit != null ? var.vm_config.cloudinit.dns_domain : null
  nameserver             = var.vm_config.cloudinit != null ? var.vm_config.cloudinit.dns_server : null
  define_connection_info = true
  scsihw                 = "virtio-scsi-pci"
  disks {
    scsi {
      scsi3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }
}