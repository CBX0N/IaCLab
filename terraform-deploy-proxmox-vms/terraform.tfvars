default_vm_config = {
  cores                    = 2
  memory                   = 2048
  target_node              = "pve"
  network_adapter_firewall = false
  network_adapter_model    = "virtio"
  network_bridge           = "vmbr0"

}

virtual_machines = {
  "bind9" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-template"
    name             = "bind9"
    # vm_state         = "running"
    # boot_order       = "order=scsi0"
    memory      = 4096
    balloon_min = 512
    cloudinit = {
      ipconfig = {
        ip      = "192.168.0.234/24"
        gateway = "192.168.0.1"
      }
      templatefile = "./cloud-inits/basic.cloud_config.tftpl"
    }
  }
  "haproxy1" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-template"
    name             = "haproxy1"
    # vm_state         = "stopped"
    # boot_order       = "order=scsi0"
    memory      = 4096
    balloon_min = 512
    cloudinit = {
      dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.214/24"
        gateway = "192.168.0.1"
      }
      templatefile = "./cloud-inits/basic.cloud_config.tftpl"
    }
  }
  "k3s0" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-template"
    name             = "k3s0"
    # vm_state         = "stopped"
    # boot_order       = "order=scsi0"
    memory      = 4096
    balloon_min = 512
    cloudinit = {
      # dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.210/24"
        gateway = "192.168.0.1"
      }
      templatefile = "./cloud-inits/basic.cloud_config.tftpl"
    }
  }
  "k3s1" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-template"
    name             = "k3s1"
    # vm_state         = "stopped"
    # boot_order       = "order=scsi0"
    memory      = 4096
    balloon_min = 512
    cloudinit = {
      # dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.211/24"
        gateway = "192.168.0.1"
      }
      templatefile = "./cloud-inits/basic.cloud_config.tftpl"
    }
  }
  "k3s2" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-template"
    name             = "k3s2"
    # vm_state         = "stopped"
    # boot_order       = "order=scsi0"
    memory      = 4096
    balloon_min = 512
    cloudinit = {
      # dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.212/24"
        gateway = "192.168.0.1"
      }
      templatefile = "./cloud-inits/basic.cloud_config.tftpl"
    }
  }
}