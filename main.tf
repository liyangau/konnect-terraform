terraform {
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

module "control-planes" {
  source = "./modules/control-planes"
  exclude_mesh_control_plane = var.exclude_mesh_control_plane
}

module "gateway-configs" {
  source = "./modules/gateway-configs"
  control_plane_tf_cp = module.control-planes.tf_cp
  gateway_services_echo = module.gateway-configs.gateway_services_echo
  gateway_services_httpbin = module.gateway-configs.gateway_services_httpbin
}

module "dev-portal" {
  source = "./modules/dev-portal"
  control_plane_tf_cp = module.control-planes.tf_cp
  gateway_services_echo = module.gateway-configs.gateway_services_echo
  gateway_services_httpbin = module.gateway-configs.gateway_services_httpbin
}