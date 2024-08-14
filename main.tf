terraform {
  backend "s3" {
    bucket                      = "konnect-terraform"
    key                         = "konnect/tf"
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
      version = "0.6.1"
    }
  }
}

provider "konnect" {
  personal_access_token = var.system_token
  server_url            = "https://${var.cp_region}.api.konghq.com"
}

module "networks" {
  source              = "./modules/networks"
  for_each            = local.networks
  network_name        = each.key
  region              = each.value.region
  allowed_cidr_blocks = each.value.allowed_cidr_blocks
  ddos_protection     = each.value.ddos_protection
  cidr_block          = each.value.cidr_block
}

module "control-planes" {
  source      = "./modules/control-planes"
  gateway_cps = local.control_planes
}

module "cloud-gateways" {
  source             = "./modules/cloud-gateways"
  for_each           = local.cloud_gateways
  name               = each.key
  region             = each.value.region
  api_access         = each.value.api_access
  control_plane_geo  = each.value.control_plane_geo
  control_plane_id   = each.value.control_plane_id
  control_plane_name = each.value.control_plane_name
  kong_version       = each.value.kong_version
  custom_domain      = each.value.custom_domain
  network_id         = each.value.network_id
}

# module "kong-configs-demo" {
#   source        = "./modules/kong-configs/demo"
#   control_plane = module.control-planes.cps["demo"]
# }

module "kong-configs-dev-au-cloud" {
  source        = "./modules/kong-configs/dev_au_cloud"
  control_plane = module.control-planes.cps["dev_au_cloud"]
}

# module "default-dev-portal" {
#   source                   = "./modules/dev-portal/default"
#   control_plane            = module.control-planes.cps["demo"]
#   gateway_services_echo    = module.kong-configs-demo.gateway_services_echo
#   gateway_services_httpbin = module.kong-configs-demo.gateway_services_httpbin
#   dev_portal_id            = konnect_portal.default_portal.id
# }