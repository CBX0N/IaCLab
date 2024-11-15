variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = ""
}

variable "github_repository" {
  description = "GitHub repository"
  type        = string
  default     = ""
}

variable "onepassword_service_account_token" {
  type = string
}

variable "onepassword_vault" {
  type = string
}

variable "onepassword_secrets" {
  type = object({
    kubeconfig = string
    github_token = string
  })
}