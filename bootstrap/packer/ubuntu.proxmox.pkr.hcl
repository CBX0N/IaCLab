packer {
  required_plugins {
    qemu = {
      version = "1.1.8"
      source  = "github.com/hashicorp/proxmox"
    }
    ansible = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "proxmox" "ubuntu" {
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
  username 
  unmount_iso = true
  template_name
}

build {
  sources = ["source.proxmox.ubuntu"]

  provisioner "file" {
    source      = "authorized_keys"
    destination = "/home/user/.ssh/authorized_keys"
  }

  provisioner "file" {
    source      = "./cloud-init/50-cloud-init.yaml"
    destination = "/tmp/50-cloud-init.yaml"
  }

  provisioner "shell" {
    inline = ["sudo mv /tmp/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml"]
  }

  provisioner "ansible" {
    playbook_file = "./ansible/plays/bootstrap.yaml"
    user = "user"
    extra_arguments = [ "--scp-extra-args", "'-O'" ]
  }
}