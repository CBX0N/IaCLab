resource "github_repository" "this" {
  name        = var.github_repository
  description = var.github_repository
  visibility  = "private"
  auto_init   = true
}

resource "local_file" "kubeconfig" {
  depends_on = [ data.onepassword_item.kubeconfig ]
    content = data.onepassword_item.kubeconfig.note_value
    filename = "${path.cwd}/k3s.yaml"
}

resource "flux_bootstrap_git" "this" {
  depends_on = [github_repository.this]
  embedded_manifests = true
  path               = "clusters/my-cluster"
}
