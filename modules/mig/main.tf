# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

module "mig" {
  source              = "terraform-google-modules/vm/google//modules/mig"
  version             = "~> 7.2.0"
  mig_name            = var.vm_name
  project_id          = var.project_id
  region              = var.region
  hostname            = var.vm_name
  subnetwork          = var.subnetwork
  autoscaling_enabled = true
  min_replicas        = var.min_replicas
  autoscaling_cpu     = var.autoscaling_cpu
  instance_template   = var.instance_template
  named_ports = [{
    name = "http"
    port = 80
  }]
}

