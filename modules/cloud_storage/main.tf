# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

resource "random_string" "r" {
  length      = 4
  min_numeric = 4
}

module "gcs_bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 3.0.0"

  name              = "${var.bucket_name}-${random_string.r.result}"
  project_id        = var.project_id
  location          = var.bucket_location
  storage_class     = var.storage_class
  log_bucket        = var.log_bucket
  log_object_prefix = var.log_object_prefix
  versioning        = var.versioning

}

