# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

module "sql-db_postgresql" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "~> 8.0.0"

  database_version = "POSTGRES_13"
  insights_config  = null
  name             = var.db_name
  project_id       = var.project_id
  zone             = var.db_zone
  region           = var.region
  # TODO: remove 
  deletion_protection = false
}
