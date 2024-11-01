resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = var.vm_config.name
  vmid        = var.vm_config.vmid
  target_node = var.vm_config.target_node
  clone       = var.vm_config.clone
  full_clone  = true
  cores       = var.vm_config.cores
  sockets     = var.vm_config.sockets
  memory      = var.vm_config.memory
  balloon     = var.vm_config.balloon
  os_type     = var.vm_config.os_type

  cicustom = var.vm_config.use_cloud_config == true ? var.vm_config.cloud_config_path : null

  ipconfig0 = var.vm_config.ipconfig
  network {
    model  = var.vm_config.nic
    bridge = var.vm_config.bridge
  }

  serial {
    id   = 0
    type = "socket"
  }

  scsihw = "virtio-scsi-pci"
  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.vm_config.disk_location
          size    = var.vm_config.disk_gb
        }
      }
      scsi3 {
        cloudinit {
          storage = var.vm_config.cloudinit_location
        }
      }
    }
  }
}
