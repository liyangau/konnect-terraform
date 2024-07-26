output "control_plane_name" {
  value = var.control_plane_name
}

output "api_access" {
  value = var.api_access
}

output "custom_domain" {
  value = var.custom_domain
}

output "dataplane_status" {
  value = konnect_cloud_gateway_configuration.cgw_dp.dataplane_groups[0].state
}