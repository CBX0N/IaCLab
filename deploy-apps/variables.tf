variable "argocd_server_admin_password" {
  type = string
  sensitive = true
}
variable "argocd_url" {
  type = string
}

variable "longhorn" {
  type = object({
    name = string
    version = string
    repository = string
    enabled = bool
  })
}

variable "ingress-nginx" {
  type = object({
    name = string
    version = string
    repository = string
    enabled = bool
  })
}

variable "argocd" {
  type = object({
    name = string
    version = string
    repository = string
    enabled = bool
    variables = list(object({
      variable = string
      value = string
    }))
  })
}