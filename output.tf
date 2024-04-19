output "tf_cp_config" {
  value = konnect_gateway_control_plane.tf-cp.config
}

output "tf_k8s_cp_config" {
  value = konnect_gateway_control_plane.tf-k8s-cp.config
}

output "portal_domain" {
  value = konnect_portal.my_portal.default_domain
}
