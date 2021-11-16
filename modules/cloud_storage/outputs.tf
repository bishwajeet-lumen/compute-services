# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

output "bucket" {
  description = "The created storage bucket"
  value       = module.gcs_bucket.bucket
}