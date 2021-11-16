# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.


variable "project_id" {
  description = "The GCP project to use"
  type        = string
}


variable "name" {
  description = "The name of the load balancer"
  type        = string
}

variable "instance_groups" {
  description = "Instance groups to balance"
  type        = set(string)
}

variable "port" {
  description = "The port to balance"
  type        = number
  default     = 80
}

variable enable_iap {
  description = "Enable IAP"
  type        = bool
  default     = false
}

variable oauth2_client_id {
  description = "OAuth2 client ID"
  type        = string
  default = null
}

variable oauth2_client_secret {
  description = "OAuth2 client secret"
  type = string
  default = null
}