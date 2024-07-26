output "gateway_cps_endpoints" {
  value = {
    for name, cp in module.control-planes.cps :
    name => cp.config if cp.cloud_gateway == false
  }
  description = "Output non cloud gateawy control planes URLs"
}

output "cloud_gateway_edge_urls" {
  value = {
    for name, instance in module.cloud-gateways :
    name => {
      status          = instance.dataplane_status
      public_edge_dns = "https://${regex("^https://([^.]+)\\.", module.control-planes.cps[instance.control_plane_name].config.control_plane_endpoint)[0]}.gateways.konghq.com"
      custom_domain   = "https://${instance.custom_domain}"
    } if instance.api_access != "private"
  }
  description = "Public edge URLs for cloud gateway data planes"
}

output "network_ids" {
  value = {
    for name, instance in module.networks :
    name => {
      id = instance.id
    }
  }
  description = "Konnect Network IDs"
}