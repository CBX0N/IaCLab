<!-- BEGIN_TF_DOCS -->


## Providers

The following providers are used by this module:

- <a name="provider_flux"></a> [flux](#provider\_flux)

- <a name="provider_local"></a> [local](#provider\_local)

- <a name="provider_onepassword"></a> [onepassword](#provider\_onepassword)

- <a name="provider_time"></a> [time](#provider\_time)

## Modules

The following Modules are called:

### <a name="module_k3s_cluster"></a> [k3s\_cluster](#module\_k3s\_cluster)

Source: github.com/CBX0N/proxmox-create-k3s-cluster

Version: v1.0.6

## Resources

The following resources are used by this module:

- [flux_bootstrap_git.repository](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/resources/bootstrap_git) (resource)
- [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) (resource)
- [onepassword_item.kubeconfig](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item) (resource)
- [time_sleep.wait_5m](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) (resource)
- [onepassword_item.cluster_ssh_keys](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)
- [onepassword_item.github_token](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)
- [onepassword_item.proxmox_api](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)
- [onepassword_item.proxmox_ssh](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_agent_node_vm_config"></a> [agent\_node\_vm\_config](#input\_agent\_node\_vm\_config)

Description: n/a

Type:

```hcl
object({
    memory             = optional(number, 1024)
    balloon            = optional(number, 512)
    cores              = optional(number, 1)
    sockets            = optional(number, 1)
    disk_size_gb       = optional(number, 40)
    os_type            = optional(string, "cloud-init")
    clone              = string
    ip_gateway         = string
    ip_prefix          = string
    subnet_size        = optional(number, 24)
    target_node        = optional(string, "pve")
    nic                = optional(string, "virtio")
    bridge             = optional(string, "vmbr0")
    disk_location      = string
    cloudinit_location = optional(string, "local-lvm")
  })
```

### <a name="input_cluster_config"></a> [cluster\_config](#input\_cluster\_config)

Description: n/a

Type:

```hcl
object({
    primary_service_run_command     = string
    secondaries_service_run_command = string
    agents_service_run_command      = string
    admin_user                      = string
    admin_password                  = optional(string, "")
    ssh_keys                        = optional(list(string), [])
    packages                        = optional(list(string), [])
    k3s_images_url                  = string
    k3s_bin_url                     = string
    k3s_service_url                 = string
    vmname_prefix                   = string
    starting_vmid                   = number
    nodes = object({
      masters = number
      agents  = number
    })
  })
```

### <a name="input_environment"></a> [environment](#input\_environment)

Description: n/a

Type: `string`

### <a name="input_master_node_vm_config"></a> [master\_node\_vm\_config](#input\_master\_node\_vm\_config)

Description: n/a

Type:

```hcl
object({
    memory             = optional(number, 4096)
    balloon            = optional(number, 4096)
    cores              = optional(number, 4)
    sockets            = optional(number, 1)
    disk_size_gb       = optional(number, 40)
    os_type            = optional(string, "cloud-init")
    clone              = string
    ip_gateway         = string
    ip_prefix          = string
    subnet_size        = optional(number, 24)
    target_node        = optional(string, "pve")
    nic                = optional(string, "virtio")
    bridge             = optional(string, "vmbr0")
    disk_location      = string
    cloudinit_location = optional(string, "local-lvm")
  })
```

### <a name="input_onepassword_secrets"></a> [onepassword\_secrets](#input\_onepassword\_secrets)

Description: n/a

Type:

```hcl
object({
    proxmox_ssh  = string
    proxmox_api  = string
    github_token = string
  })
```

### <a name="input_onepassword_service_account_token"></a> [onepassword\_service\_account\_token](#input\_onepassword\_service\_account\_token)

Description: n/a

Type: `string`

### <a name="input_onepassword_vault"></a> [onepassword\_vault](#input\_onepassword\_vault)

Description: n/a

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_github_branch"></a> [github\_branch](#input\_github\_branch)

Description: GitHub repository

Type: `string`

Default: `"master"`

### <a name="input_github_org"></a> [github\_org](#input\_github\_org)

Description: GitHub organization

Type: `string`

Default: `""`

### <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository)

Description: GitHub repository

Type: `string`

Default: `""`
<!-- END_TF_DOCS -->