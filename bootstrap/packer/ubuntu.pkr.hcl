packer {
  required_plugins {
    qemu = {
      version = "1.1.0"
      source  = "github.com/hashicorp/qemu"
    }
    vagrant = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "qemu" "ubuntu" {
  format           = "qcow2"
  disk_image       = true
  disk_size        = "10G"
  headless         = true
  iso_checksum     = "file:https://cloud-images.ubuntu.com/focal/current/SHA256SUMS"
  iso_url          = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  qemuargs         = [["-m", "12G"], ["-smp", "8"], ["-cdrom", "cidata.iso"], ["-serial", "mon:stdio"]]
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  ssh_password     = "packer"
  ssh_username     = "user"
  vm_name          = "bootstrap"
}

build {
  sources = ["source.qemu.ubuntu"]

  provisioner "file" {
    source      = "authorized_keys"
    destination = "/home/user/.ssh/authorized_keys"
  }

  post-processors {
    post-processor "vagrant" {
      keep_input_artifact = true
      provider_override   = "libvirt"
      output              = "{{.BuildName}}_bootstrap_{{.Provider}}_{{.Architecture}}.box"
    }
  }
  #   provisioner "ansible" {
  #     playbook_file = "ansible/qemu.yml"
  #   }
}