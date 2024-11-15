data "onepassword_item" "kubeconfig" {
  vault = var.onepassword_vault
  title = var.onepassword_secrets.kubeconfig
}

data "onepassword_item" "github_token" {
  vault    = var.onepassword_vault
  title = var.onepassword_secrets.github_token
}