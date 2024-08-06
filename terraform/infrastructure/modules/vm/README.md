<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) (3.0.1-rc3)

## Providers

The following providers are used by this module:

- <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) (3.0.1-rc3)

## Resources

The following resources are used by this module:

- [proxmox_vm_qemu.vm](https://registry.terraform.io/providers/Telmate/proxmox/3.0.1-rc3/docs/resources/vm_qemu) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_default_vm_config"></a> [default\_vm\_config](#input\_default\_vm\_config)

Description: n/a

Type:

```hcl
object({
    cores                    = number
    memory                   = number
    target_node              = string
    network_bridge           = string
    network_adapter_firewall = bool
    network_adapter_model    = string
  })
```

### <a name="input_vm_config"></a> [vm\_config](#input\_vm\_config)

Description: n/a

Type:

```hcl
object({
    count            = number
    name             = string
    desc             = optional(string, null)
    boot_order       = optional(string, null)
    target_node      = optional(string, null)
    vm_template_name = string
    vm_state         = optional(string, "stopped")
    qemu_agent       = optional(number, 1)
    cores            = optional(number, null)
    memory           = optional(number, null)
    balloon_min      = optional(number, null)
    network = optional(object({
      bridge   = string
      firewall = bool
      model    = string
    }))
  })
```

## Outputs

The following outputs are exported:

### <a name="output_vm_ips"></a> [vm\_ips](#output\_vm\_ips)

Description: n/a
<!-- END_TF_DOCS -->