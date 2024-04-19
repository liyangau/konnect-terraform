resource "konnect_gateway_route" "catch_all" {
  name  = "catch-all-route"
  paths = ["/"]

  strip_path = false

  control_plane_id = var.control_plane_dev.id
}

resource "konnect_gateway_plugin_request_termination" "catch_all_terminate" {
  enabled          = true
  control_plane_id = var.control_plane_dev.id
  route = {
    id = konnect_gateway_route.catch_all.id
  }
  config = {
    message     = "🚧😮‍💨"
    status_code = 503
  }
}