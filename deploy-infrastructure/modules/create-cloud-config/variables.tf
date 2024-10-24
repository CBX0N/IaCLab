variable "cloud_config" {
  type = object({
    name         = string
    templatefile = string
    ssh_user     = string
    ssh_password = string
    ssh_host     = string
  })
}
