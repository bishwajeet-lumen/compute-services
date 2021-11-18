# VM COTS Pattern

This folder contains an example to create an instance template, two managed instance group with an autoscaler, one regional tcp lb and one global http lb

Modules documentation links:

| Module | Links ||
| --- | --- | --- |
| Mig + Instance template | [Registry](https://registry.terraform.io/modules/terraform-google-modules/vm/google/latest) |[GitHub](https://github.com/terraform-google-modules/terraform-google-vm) |
| TCP Load Balancer | [Registry](https://registry.terraform.io/modules/GoogleCloudPlatform/lb/google/latest) |[GitHub](https://github.com/terraform-google-modules/terraform-google-lb) |
| Global HTTPS Load Balancer | [Registry](https://registry.terraform.io/modules/GoogleCloudPlatform/lb-http/google/latest) | [GitHub](https://github.com/terraform-google-modules/terraform-google-lb-http) |
| Cloud Storage (Simple bucket) | [Registry](https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/latest/submodules/simple_bucket) | [GitHub](https://github.com/terraform-google-modules/terraform-google-cloud-storage/tree/v3.0.0/modules/simple_bucket) |
| Cloud SQL (PostgreSQL) | [Registry](https://registry.terraform.io/modules/GoogleCloudPlatform/sql-db/google/latest/submodules/postgresql) | [GitHub](https://github.com/terraform-google-modules/terraform-google-sql-db/tree/master/modules/postgresql) |

## Warnings :warning:

- With provided startup script a Cloud NAT is needed for each region in order to install nginx in the created VMs
- LB modules creates firewall rules to allow trafic to the vm's on the configured ports for app and hc
