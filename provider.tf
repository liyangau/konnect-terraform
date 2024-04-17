terraform {
  required_providers {
    konnect = {
      source  = "Kong/konnect"
      version = "0.1.0"
    }
  }
}

provider "konnect" {
  personal_access_token = var.system_token
  server_url            = "https://${var.cp_region}.api.konghq.com/v2"
}