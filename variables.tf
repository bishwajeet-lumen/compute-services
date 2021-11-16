/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "regions" {
  type = map(object({ name = string, short = string }))
  default = {
    region_a = { name = "us-east4", short = "e4" },
    region_b = { name = "europe-west4", short = "w4" }
  }
}

variable "project_id" {
  type = string
}



variable "d" {
  description = "Division Code (b / r)"
  type        = string
}
variable "e" {
  description = "Service Project Environment Code"
  type        = string
}
variable "c" {
  description = "Cloud Name"
  type        = string
}

variable "a" {
  description = "Application Type (internal / external)"
  type        = string
}
variable "ac" {
  description = "4 digit Application Code"
  type        = string
}
variable "t" {
  description = "Resource Type"
  type        = string
}
variable "it" {
  description = "Iteration Number"
  type        = string
}
variable "env" {
  description = "Dev Project Environment Name"
  type        = string
}
