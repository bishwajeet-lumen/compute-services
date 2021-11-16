# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

data "template_file" "startup_script" {
  template = file("./files/startup.sh")
}

module "mig_template" {
  source = "./modules/mig_template"

  project_id = var.project_id
  vpc        = "default"

  atp = "missing"
  cam = "onboarded"
  cis = "not_applied"
  oms = "excluded"

  vm_name = "${var.d}${var.e}${var.c}mr${var.a}${var.ac}${var.t}${var.it}"

  image_project = "ubuntu-os-cloud"
  image_family  = "ubuntu-1804-lts"
  image_name    = "ubuntu-1804-bionic-v20211021"

  machine_type = "e2-medium"
  service_account = {
    "email" : "1048397736058-compute@developer.gserviceaccount.com"
    # TODO: restrict more
    "scopes" : ["cloud-platform"]
  }

  startup_script = data.template_file.startup_script.rendered
}

module "mig" {
  for_each = var.regions
  source   = "./modules/mig"

  project_id = var.project_id
  vpc        = "default"
  subnetwork = "default"
  region     = each.value.name

  autoscaling_enabled = true
  min_replicas        = 1
  autoscaling_cpu = [{
    "target" = 0.6
  }]

  vm_name           = "${var.d}${var.e}${var.c}${each.value.short}${var.a}${var.ac}${var.t}${var.it}"
  instance_template = module.mig_template.self_link
}

module "global_load_balancer" {
  source = "./modules/https_load_balancer"

  project_id = var.project_id

  name            = "${var.d}${var.e}${var.c}mr${var.a}${var.ac}${var.t}${var.it}"
  instance_groups = [for mig in module.mig : mig.instance_group]
}

module "bucket" {
  source = "./modules/cloud_storage"

  project_id = var.project_id

  bucket_name     = "example-bucket"
  versioning      = true
  bucket_location = var.regions.region_a.name
  storage_class   = "STANDARD"

}

module "postgresql" {
  source = "./modules/postgresql"

  project_id = var.project_id

  db_name = "example-db"
  db_zone = "us-east4-a"
  region  = var.regions.region_a.name
}
