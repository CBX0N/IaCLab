# resource "proxmox_storage_iso" "vyos" {
#   url = "https://github.com/vyos/vyos-rolling-nightly-builds/releases/download/1.5-rolling-202406250020/vyos-1.5-rolling-202406250020-amd64.iso"
#   filename = "vyos-1.5-rolling-202406250020-amd64.iso"
#   pve_node = "pve"
#   storage = "local"
#   checksum = ""
# }

# resource "proxmox_vm_qemu" "vyos_vm" {
#   target_node = "pve"
#   network {
#     bridge = "vmbr0"
#     model = "virtio"
#   }
#   disks {
#     ide {
#       ide0 {
#         cdrom {
#           iso = "local:iso/vyos-1.5-rolling-202406250020-amd64.iso"
#         }
#       }
#       ide1 {
#         disk {
#           storage = "datastore1"
#           size = 20
#         }
#       }
#     }
#   }
  
# }

module "ns_vms" {
  # Deploy Docker VM's
  source            = "./modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.ns_vm_config
}

module "k3s_vms" {
  # Deploy K3s VM's
  source            = "./modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.k3s_vm_config
}

module "lb_vms" {
  # Deploy HAProxy VM's
  source            = "./modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.lb_vm_config
}