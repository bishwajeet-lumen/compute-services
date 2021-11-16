# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

variable "project_id" {
  description = "The GCP project to use"
  type        = string
}

variable "bucket_name" {
  description = "Name of the GCS Bucket"
  type        = string
}

variable "versioning" {
  description = "Enable / Disable Versioning"
  type        = bool
}

variable "bucket_location" {
  description = "Location code for where the GCS bucket needs to reside"
  type = string
}


variable "storage_class" {
  description = "Storage class"
  type        = string
  validation {
    condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.storage_class)
    error_message = "Valid values for var: storage_class are (STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE)."
  }
}

variable "log_bucket" {
  description = "The bucket that will receive log objects."
  type        = string
  default     = null
}

variable "log_object_prefix" {
  description = "The object prefix for log objects. If it's not provided, by default GCS sets this to this bucket's name"
  type        = string
  default     = null
}