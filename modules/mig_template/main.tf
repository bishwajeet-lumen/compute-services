# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

module "mig_template" {
  source          = "terraform-google-modules/vm/google//modules/instance_template"
  version         = "~> 7.2.0"
  project_id      = var.project_id
  machine_type    = var.machine_type
  service_account = var.service_account
  network         = var.vpc
  name_prefix            = "${var.vm_name}-template"
  labels = {
    "atp" = var.atp
    "cam" = var.cam
    "cis" = var.cis
    "oms" = var.oms
  }
  source_image_project = var.image_project
  source_image_family  = var.image_family
  source_image         = var.image_name
  disk_type            = "pd-ssd"
  disk_size_gb         = 10
  startup_script       = var.startup_script

  tags = var.tags
}

