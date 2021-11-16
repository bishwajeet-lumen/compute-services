# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

variable "project_id" {
  description = "The GCP project to use"
  type        = string
}

variable "vpc" {
  description = "VPC"
  type        = string
}

variable "atp" {
  description = "atp (onboarded, missing, excluded)"
  type        = string
  validation {
    condition     = contains(["onboarded", "missing", "excluded"], var.atp)
    error_message = "Valid values for var: atp are (onboarded, missing, excluded)."
  }
}

variable "cam" {
  description = "cam (onboarded, missing, excluded)"
  type        = string
  validation {
    condition     = contains(["onboarded", "missing", "excluded"], var.cam)
    error_message = "Valid values for var: cam are (onboarded, missing, excluded)."
  }
}

variable "cis" {
  description = "CIS (applied, not_applied, excluded)"
  type        = string
  validation {
    condition     = contains(["applied", "not_applied", "excluded"], var.cis)
    error_message = "Valid values for var: cis are (applied, not_applied, excluded)."
  }
}

variable "oms" {
  description = "oms (onboarded, missing, excluded)"
  type        = string
  validation {
    condition     = contains(["onboarded", "missing", "excluded"], var.oms)
    error_message = "Valid values for var: oms are (onboarded, missing, excluded)."
  }
}

variable "vm_name" {
  description = "Compute instance name: div-env-cloud-region-int/ext-appname-resourcetype-iteration"
  type        = string
}

variable "image_project" {
  description = "Image project"
  type        = string
}

variable "image_family" {
  description = "Image family"
  type        = string
}

variable "image_name" {
  description = "Image name"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
}

variable "service_account" {
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account."
  type = object({
    email : string,
    scopes : set(string),
  })
}

variable "startup_script" {
  description = "Startup script for instance template"
  type = string
  default = null
}

variable "tags" {
  description = "Tags to apply to the instance template"
  type        = list(string)
  default = []
}