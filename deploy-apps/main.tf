resource "helm_release" "metallb" {
  name             = "metallb"
  chart            = "metallb"
  repository       = "https://metallb.github.io/metallb"
  create_namespace = true
  cleanup_on_fail  = true
}

resource "helm_release" "ingress-nginx" {
  name             = "ingress-nginx"
  chart            = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  create_namespace = true
  cleanup_on_fail  = true
  version          = "4.11.3"
}

resource "helm_release" "longhorn" {
  name             = "longhorn"
  chart            = "longhorn"
  repository       = "https://charts.longhorn.io"
  create_namespace = true
  cleanup_on_fail  = true
  version          = "1.7.2"
}

resource "helm_release" "argocd" {
  name             = "argo-cd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  create_namespace = true
  cleanup_on_fail  = true
  version          = "7.6.12"

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_server_admin_password
  }
  set {
    name = "server.ingress.enabled"
    value = "true"
  }
}

