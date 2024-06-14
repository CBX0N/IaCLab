packer {
  required_plugins {
    name = {
      version = "1.1.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

source "qemu" "ubuntu" {
  format            = "qcow2"
  disk_image        = true
  disk_size         = "10G"
  headless          = false
  iso_checksum      = "file:https://cloud-images.ubuntu.com/focal/current/SHA256SUMS"
  iso_url           = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  qemuargs          = [["-m", "12G"], ["-smp", "8"], ["-cdrom", "cidata.iso"], ["-serial", "mon:stdio"]]
  shutdown_command  = "echo 'packer' | sudo -S shutdown -P now"
  ssh_password      = "packer"
  ssh_username      = "user"
  vm_name           = "build.qcow2"
  output_directory  = "output"
  boot_wait         = "3s"
  boot_key_interval = "150ms"
  http_directory    = "http"
}

build {
  sources = ["source.qemu.ubuntu"]

  #   provisioner "ansible" {
  #     playbook_file = "ansible/qemu.yml"
  #   }
}