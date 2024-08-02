packer {
  required_plugins {
    qemu = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "ubuntu-noble" {
  template_name            = "ubuntu-noble-base-image"
  template_description     = ""
  node                     = var.proxmox_node
  username                 = var.proxmox_user
  token                    = var.proxmox_token
  proxmox_url              = var.proxmox_url
  insecure_skip_tls_verify = true
  http_directory           = "config"
  ssh_username             = "packer"
  ssh_password             = "packer"
  ssh_timeout              = "15m"
  unmount_iso              = true
  iso_storage_pool         = "local"
  iso_checksum             = "8762f7e74e4d64d72fceb5f70682e6b069932deedb4949c6975d0f0fe0a91be3"
  iso_download_pve         = true
  iso_url                  = "https://releases.ubuntu.com/noble/ubuntu-24.04-live-server-amd64.iso"
  boot_command             = ["e", "<down><down><down><end><bs><bs><bs>", "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---", "<f10>"]
  boot_wait                = "5s"
  memory                   = "4096"
  disks {
    disk_size    = "20G"
    storage_pool = "datastore1"
    type         = "scsi"
    ssd          = "true"
  }
  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

build {
  sources = ["source.proxmox-iso.ubuntu-noble"]

  provisioner "file" {
    source      = "./config/50-cloud-init.yaml"
    destination = "/tmp/50-cloud-init.yaml"
  }

  provisioner "shell" {
    inline = ["echo 'packer' | sudo -S mv /tmp/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml"]
  }
}