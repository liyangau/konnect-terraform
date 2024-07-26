resource "konnect_cloud_gateway_custom_domain" "cgw_custom_domain" {
  control_plane_geo = var.control_plane_geo
  control_plane_id  = var.control_plane_id
  domain            = var.custom_domain
}