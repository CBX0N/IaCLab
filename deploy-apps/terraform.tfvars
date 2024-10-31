argocd_url = "192.168.0.211"

longhorn = {
  name       = "longhorn"
  repository = "https://charts.longhorn.io"
  namespace  = "longhorn"
  version    = "1.7.2"
  enabled    = true
}

ingress-nginx = {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "4.11.3"
  enabled    = false
}

metallb = {
  name       = "metallb"
  repository = "https://metallb.github.io/metallb"
  enabled    = true
}