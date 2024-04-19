terraform {
  # cloud {
  #   organization = "fomm"

  #   workspaces {
  #     name = "fomm-au"
  #   }
  # }
  backend "s3" {
    bucket                      = "konnect-terraform"
    key                         = "konnect/prod"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
    region                      = "us-east-1"
  }

  required_providers {
    konnect = {
      source  = "Kong/konnect"
      version = "0.2.0"
    }
  }
}

provider "konnect" {
  personal_access_token = var.system_token
  server_url            = "https://${var.cp_region}.api.konghq.com"
}
