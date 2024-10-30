resource "helm_release" "metallb" {
  count            = var.metallb.enabled == true ? 1 : 0
  name             = var.metallb.name
  chart            = var.metallb.name
  repository       = var.metallb.repository
  create_namespace = true
  cleanup_on_fail  = true
  version          = var.metallb.version
  dynamic "set" {
    for_each = var.metallb.variables != null ? var.metallb.variables : []
    content {
      name  = set.value.variable
      value = set.value.content
    }
  }
}

resource "helm_release" "ingress-nginx" {
  count            = var.ingress-nginx.enabled == true ? 1 : 0
  name             = var.ingress-nginx.name
  chart            = var.ingress-nginx.name
  repository       = var.ingress-nginx.repository
  create_namespace = true
  cleanup_on_fail  = true
  version          = var.ingress-nginx.version
  dynamic "set" {
    for_each = var.ingress-nginx.variables != null ? var.ingress-nginx.variables : []
    content {
      name  = set.value.variable
      value = set.value.content
    }
  }
}

resource "helm_release" "longhorn" {
  count            = var.longhorn.enabled == true ? 1 : 0
  name             = var.longhorn.name
  chart            = var.longhorn.name
  repository       = var.longhorn.repository
  create_namespace = true
  cleanup_on_fail  = true
  version          = var.longhorn.version
  dynamic "set" {
    for_each = var.longhorn.variables != null ? var.longhorn.variables : []
    content {
      name  = set.value.variable
      value = set.value.content
    }
  }
}

resource "helm_release" "argocd" {
  count            = var.argocd.enabled == true ? 1 : 0
  name             = var.argocd.name
  chart            = var.argocd.name
  repository       = var.argocd.repository
  namespace        = var.argocd.namespace
  create_namespace = true
  cleanup_on_fail  = true
  version          = var.argocd.version
  dynamic "set" {
    for_each = var.argocd.variables != null ? var.argocd.variables : []
    content {
      name  = set.value.variable
      value = set.value.content
    }
  }
}