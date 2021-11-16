# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

output "external_ip" {
  description = "The external IPv4 assigned to the global fowarding rule."
  value       = module.global_http_lb.external_ip
}