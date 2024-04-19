resource "konnect_gateway_service" "echo" {
  name             = "echo-svc"
  protocol         = "http"
  host             = "echo"
  port             = 8080
  path             = "/"
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_route" "echo" {
  methods = ["GET"]
  name    = "echo-route"
  paths   = ["/echo"]

  strip_path = false

  control_plane_id = konnect_gateway_control_plane.tf-cp.id

  service = {
    id = konnect_gateway_service.echo.id
  }
}

resource "konnect_gateway_plugin_key_auth" "key_auth" {
  enabled          = true
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
  service = {
    id = konnect_gateway_service.echo.id
  }
  config = {
    hide_credentials = false
  }
}