<!-- BEGIN_TF_DOCS -->


## Providers

The following providers are used by this module:

- <a name="provider_onepassword"></a> [onepassword](#provider\_onepassword)

## Modules

The following Modules are called:

### <a name="module_fluxcd_bootstrap"></a> [fluxcd\_bootstrap](#module\_fluxcd\_bootstrap)

Source: github.com/CBX0N/bootstrap-fluxcd-github

Version: v1.0.1

### <a name="module_k3s_cluster"></a> [k3s\_cluster](#module\_k3s\_cluster)

Source: github.com/CBX0N/proxmox-create-k3s-cluster

Version: v1.0.5

## Resources

The following resources are used by this module:

- [onepassword_item.kubeconfig](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item) (resource)
- [onepassword_item.cluster_ssh_keys](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)
- [onepassword_item.github_token](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)
- [onepassword_item.proxmox_api](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)
- [onepassword_item.proxmox_ssh](https://registry.terraform.io/providers/1Password/onepassword/latest/docs/data-sources/item) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_cluster_config"></a> [cluster\_config](#input\_cluster\_config)

Description: n/a

Type:

```hcl
object({
    primary_service_run_command     = string
    secondaries_service_run_command = string
    admin_user                      = string
    admin_password                  = optional(string, "")
    ssh_keys                        = optional(list(string), [])
    packages                        = optional(list(string), [])
    k3s_images_url                  = string
    k3s_bin_url                     = string
    k3s_service_url                 = string
  })
```

### <a name="input_environment"></a> [environment](#input\_environment)

Description: n/a

Type: `string`

### <a name="input_nodes"></a> [nodes](#input\_nodes)

Description: n/a

Type:

```hcl
map(object({
    type = string
    vmid = number
  }))
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

### <a name="input_proxmox_vm_config"></a> [proxmox\_vm\_config](#input\_proxmox\_vm\_config)

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

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_github_org"></a> [github\_org](#input\_github\_org)

Description: GitHub organization

Type: `string`

Default: `""`

### <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository)

Description: GitHub repository

Type: `string`

Default: `""`

### <a name="input_github_repository_visibility"></a> [github\_repository\_visibility](#input\_github\_repository\_visibility)

Description: GitHub repository visibility

Type: `string`

Default: `"private"`
<!-- END_TF_DOCS -->