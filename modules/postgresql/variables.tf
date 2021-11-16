variable "db_name" {
  description = "The name of the Cloud SQL resources"
  type        = string
}

variable "project_id" {
  description = "The project ID to manage the Cloud SQL resources"
  type        = string
}

variable "db_zone" {
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  type        = string
}

variable "region" {
  description = "The region of the Cloud SQL resources"
  type        = string
}
