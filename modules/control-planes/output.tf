output "cps" {
  value = {
    for name, cp in konnect_gateway_control_plane.cps :
    name => cp
  }
  description = "Return all created control planes"
}