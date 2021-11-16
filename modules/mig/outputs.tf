# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

output "instance_group" {
  description = "Instance-group url of managed instance group"
  value       = module.mig.instance_group
}
