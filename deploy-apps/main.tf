resource "helm_release" "metallb" {
  name             = "metallb"
  chart            = "metallb"
  repository       = "https://metallb.github.io/metallb"
  create_namespace = true
  cleanup_on_fail  = true
  count = 0
}

resource "helm_release" "ingress-nginx" {
  name             = var.ingress-nginx.name
  chart            = var.ingress-nginx.name
  repository       = var.ingress-nginx.repository
  create_namespace = true
  cleanup_on_fail  = true
  version          = var.ingress-nginx.version
  count = var.ingress-nginx.enabled == true ? 1 : 0
}

resource "helm_release" "longhorn" {
  name             = var.longhorn.name
  chart            = var.longhorn.name
  repository       = var.longhorn.repository
  create_namespace = true
  cleanup_on_fail  = true
  version          = var.longhorn.version
  count = var.longhorn.enabled == true ? 1 : 0
}

resource "helm_release" "argocd" {
  name             = var.argocd.name
  chart            = var.argocd.name
  repository       = var.argocd.repository
  create_namespace = true
  cleanup_on_fail  = true
  version          = var.argocd.version

  dynamic "set" {
    for_each = var.argocd.variables
    content {
      name = set.variable
      value = set.value
    }
  }
}