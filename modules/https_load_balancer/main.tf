# Copyright 2021 Google LLC. This software is provided as is, without
# warranty or representation for any use or purpose. Your use of it is
# subject to your agreement with Google.

module "global_http_lb" {
  source  = "GoogleCloudPlatform/lb-http/google"
  version = "~> 6.1.1"

  project = var.project_id
  name    = var.name
  backends = {
    default = {
      protocol    = "HTTP"
      port        = var.port
      port_name   = "http"
      timeout_sec = 10
      enable_cdn  = false

      affinity_cookie_ttl_sec         = null
      connection_draining_timeout_sec = null
      custom_request_headers          = null
      custom_response_headers          = null
      description                     = null
      security_policy                 = null
      session_affinity                = null

      health_check = {
        request_path = "/"
        port         = var.port

        check_interval_sec  = null
        healthy_threshold   = null
        host                = null
        logging             = null
        timeout_sec         = null
        unhealthy_threshold = null
      }

      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        for group in var.instance_groups :
          {
            group = group
            balancing_mode               = null
            capacity_scaler              = null
            description                  = null
            max_connections              = null
            max_connections_per_endpoint = null
            max_connections_per_instance = null
            max_rate                     = null
            max_rate_per_endpoint        = null
            max_rate_per_instance        = null
            max_utilization              = null
          }
      ]

      iap_config = {
        enable = var.enable_iap

        oauth2_client_id     = var.oauth2_client_id
        oauth2_client_secret = var.oauth2_client_secret
      }
    }
  }
}
