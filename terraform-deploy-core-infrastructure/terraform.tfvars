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
    vm_template_name = "ubuntu-noble-cloud-init-enabled-base-image"
    name             = "bind9"
    desc             = "bind9 deployed by Terraform & Configured with Ansible"
    vm_state         = "running"
    boot_order       = "order=scsi0"
    memory           = 4096
    cloudinit = {
      ipconfig = {
        ip      = "192.168.0.234/24"
        gateway = "192.168.0.1"
      }
      templatefile = "./cloud-inits/bind9.cloud_config.tftpl"
    }
  }
  "k3s0" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-cloud-init-enabled-base-image"
    name             = "k3s0"
    desc             = "k3s deployed by Terraform & Configured with Ansible"
    # vm_state         = "running"
    # boot_order       = "order=scsi0"
    memory           = 4096
    cloudinit = {
      dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.210/24"
        gateway = "192.168.0.1"
      }
    }
  }
  "k3s1" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-cloud-init-enabled-base-image"
    name             = "k3s1"
    desc             = "k3s deployed by Terraform & Configured with Ansible"
    # vm_state         = "running"
    # boot_order       = "order=scsi0"
    memory           = 4096
    cloudinit = {
      dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.211/24"
        gateway = "192.168.0.1"
      }
    }
  }
  "k3s2" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-cloud-init-enabled-base-image"
    name             = "k3s2"
    desc             = "k3s deployed by Terraform & Configured with Ansible"
    # vm_state         = "running"
    # boot_order       = "order=scsi0"
    memory           = 4096
    cloudinit = {
      dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.212/24"
        gateway = "192.168.0.1"
      }
    }
  }
  # "k3s3" = {
  #   qemu_agent       = 1
  #   vm_template_name = "ubuntu-noble-cloud-init-enabled-base-image"
  #   name             = "k3s3"
  #   desc             = "k3s deployed by Terraform & Configured with Ansible"
  #   vm_state         = "running"
  #   boot_order       = "order=scsi0"
  #   memory           = 4096
  #   balloon_min      = 512
  #   cloudinit = {
  #     dns_server = "192.168.0.234"
  #     dns_domain = "internal.cbxon.co.uk"
  #     ipconfig = {
  #       ip      = "192.168.0.213/24"
  #       gateway = "192.168.0.1"
  #     }
  #   }
  # }
  "haproxy1" = {
    qemu_agent       = 1
    vm_template_name = "ubuntu-noble-cloud-init-enabled-base-image"
    name             = "haproxy1"
    desc             = "k3s deployed by Terraform & Configured with Ansible"
    vm_state         = "running"
    boot_order       = "order=scsi0"
    memory           = 4096
    balloon_min      = 512
    cloudinit = {
      dns_server = "192.168.0.234"
      dns_domain = "internal.cbxon.co.uk"
      ipconfig = {
        ip      = "192.168.0.214/24"
        gateway = "192.168.0.1"
      }
      templatefile = "./cloud-inits/haproxy.cloud_config.tftpl"
    }
  }
}