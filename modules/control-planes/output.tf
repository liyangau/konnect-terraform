output "dev" {
  value = konnect_gateway_control_plane.cps["dev"]
}

output "home_cluster" {
  value = konnect_gateway_control_plane.cps["home_cluster"]
}

output "staging" {
  value = konnect_gateway_control_plane.cps["staging"]
}