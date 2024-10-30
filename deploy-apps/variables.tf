variable "argocd_url" {
  type = string
}

variable "longhorn" {
  type = object({
    name       = string
    version    = optional(string, null)
    repository = string
    enabled    = bool
    variables = optional(list(object({
      variable = string
      content  = string
    })), null)
  })
}

variable "ingress-nginx" {
  type = object({
    name       = string
    version    = optional(string, null)
    repository = string
    enabled    = bool
    variables = optional(list(object({
      variable = string
      content  = string
    })), null)
  })
}

variable "argocd" {
  type = object({
    name       = string
    version    = optional(string, null)
    repository = string
    namespace    = optional(string,null)
    enabled    = bool
    variables = optional(list(object({
      variable = string
      content  = string
    })), null)
  })
}

variable "metallb" {
  type = object({
    name       = string
    version    = optional(string, null)
    repository = string
    namespace    = optional(string,null)
    enabled    = bool
    variables = optional(list(object({
      variable = string
      content  = string
    })), null)
  })
}