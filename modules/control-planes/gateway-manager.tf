resource "konnect_gateway_control_plane" "cps" {
  for_each = local.control_plane_with_labels
  name = each.value.name
  cluster_type = each.value.type
  cloud_gateway = each.value.cloud_gateway
  auth_type    = each.value.auth_type
  labels = each.value.labels
  description = each.value.description
}