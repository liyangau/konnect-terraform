resource "konnect_gateway_plugin_key_auth" "key_auth" {
  enabled          = true
  control_plane_id = var.control_plane.id
  config = {
    hide_credentials = false
  }
}