<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) (3.0.1-rc3)

## Modules

The following Modules are called:

### <a name="module_ns_vms"></a> [ns\_vms](#module\_ns\_vms)

Source: ./modules/vm

Version:

### <a name="module_k3s_vms"></a> [k3s\_vms](#module\_k3s\_vms)

Source: ./modules/vm

Version:

### <a name="module_lb_vms"></a> [lb\_vms](#module\_lb\_vms)

Source: ./modules/vm

Version:

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

### <a name="input_ns_vm_config"></a> [ns\_vm\_config](#input\_ns\_vm\_config)

Description: n/a

Type:

```hcl
object({
    count            = optional(number, 0)
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

### <a name="input_k3s_vm_config"></a> [k3s\_vm\_config](#input\_k3s\_vm\_config)

Description: n/a

Type:

```hcl
object({
    count            = optional(number, 0)
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

### <a name="input_lb_vm_config"></a> [lb\_vm\_config](#input\_lb\_vm\_config)

Description: n/a

Type:

```hcl
object({
    count            = optional(number, 0)
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

### <a name="input_pm_api_token_id"></a> [pm\_api\_token\_id](#input\_pm\_api\_token\_id)

Description: n/a

Type: `string`

### <a name="input_pm_api_token_secret"></a> [pm\_api\_token\_secret](#input\_pm\_api\_token\_secret)

Description: n/a

Type: `string`

### <a name="input_pm_api_url"></a> [pm\_api\_url](#input\_pm\_api\_url)

Description: n/a

Type: `string`

## Outputs

The following outputs are exported:

### <a name="output_ns_vm_ips"></a> [ns\_vm\_ips](#output\_ns\_vm\_ips)

Description: n/a
<!-- END_TF_DOCS -->