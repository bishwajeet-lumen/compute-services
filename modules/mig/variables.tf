# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

variable "project_id" {
  description = "The GCP project to use"
  type        = string
}

variable "region" {
  description = "The GCP region to create and test resources in"
  type        = string
}

variable "vpc" {
  description = "VPC"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to host the compute instances in"
}

variable "vm_name" {
  description = "Compute instance name: div-env-cloud-region-int/ext-appname-resourcetype-iteration"
  type        = string
}

variable "autoscaling_enabled" {
  description = "Creates an autoscaler for the managed instance group"
  type        = bool
}

variable "min_replicas" {
  description = "The minimum number of replicas that the autoscaler can scale down to. This cannot be less than 0."
  type        = number
  default = null
}

variable "autoscaling_cpu" {
  description = "Autoscaling, cpu utilization policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#cpu_utilization"
  type        = list(map(number))
  default = []
}

variable "instance_template" {
  description = "Instance template name"
  type        = string
}