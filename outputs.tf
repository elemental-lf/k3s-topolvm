output "extra_server_arg" {
  value = ["--kube-scheduler-arg='--config=/etc/rancher/k3s/scheduler-config-${var.scheduler_config_version}.yaml'"]
}

output "extra_files" {
  value = {
    "/etc/rancher/k3s/scheduler-config-v1beta1.yaml" = {
      content = file("${path.module}/manifests/scheduler-config-v1beta1.yaml")
      mode    = "0600"
    }
    "/etc/rancher/k3s/scheduler-config-v1beta2.yaml" = {
      content = file("${path.module}/manifests/scheduler-config-v1beta2.yaml")
      mode    = "0600"
    }
    "/var/lib/rancher/k3s/server/manifests/cert-manager.yaml" = {
      content = file("${path.module}/manifests/cert-manager.yaml")
      mode    = "0600"
    }
    "/var/lib/rancher/k3s/server/manifests/topolvm.yaml" = {
      content = templatefile("${path.module}/manifests/topolvm.yaml", {
        chart_version: var.chart_version,
        image_tag: var.image_tag,
      })
      mode    = "0600"
    }
  }
}
