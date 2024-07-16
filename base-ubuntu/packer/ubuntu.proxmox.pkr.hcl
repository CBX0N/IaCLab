packer {
  required_plugins {
    qemu = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

variable "proxmox_url" {
  type = string
  description = "Proxmox API URL, E.G. https://proxmox:8006/api2/json"
}

variable "proxmox_token" {
  type = string
  description = "Proxmox API Token"
}

variable "proxmox_user" {
  type = string
  description = "Proxmox API User E.G. root@pam!terraform"
}

variable "proxmox_node" {
  type = string
  description = "Proxmox Node E.G. pve"
}


source "proxmox-iso" "ubuntu-jammy" {
  template_name            = "ubuntu-jammy-base-image"
  template_description     = ""
  node                     = var.proxmox_node
  username                 = var.proxmox_user
  token                    = var.proxmox_token
  proxmox_url              = var.proxmox_url
  insecure_skip_tls_verify = true
  http_directory           = "http"
  ssh_username             = "root"
  ssh_password             = "packer"
  ssh_timeout              = "15m"
  unmount_iso              = true
  # iso_storage_pool         = "local"
  # iso_checksum             = "45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"
  iso_file                 = "local:iso/ubuntu-24.04-live-server-amd64.iso"
  # iso_url                  = "https://releases.ubuntu.com/22.04/ubuntu-22.04.4-live-server-amd64.iso"
  boot_command             = [ "e","<down><down><down><end><bs><bs><bs>","autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---"]
  boot_wait                = "5s"
  disks {
    disk_size    = "5G"
    storage_pool = "datastore1"
    type         = "scsi"
  }
  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

build {
  sources = ["source.proxmox-iso.ubuntu-jammy"]
}