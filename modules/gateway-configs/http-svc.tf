resource "konnect_gateway_service" "httpbin" {
  name             = "httpbin-svc"
  protocol         = "http"
  host             = "httpbin"
  port             = 8080
  path             = "/"
  control_plane_id = var.control_plane_dev.id
}

resource "konnect_gateway_route" "httpbin" {
  methods = ["GET"]
  name    = "httpbin-route"
  paths   = ["/bin"]

  strip_path = false

  control_plane_id = var.control_plane_dev.id

  service = {
    id = konnect_gateway_service.httpbin.id
  }
}

resource "konnect_gateway_plugin_basic_auth" "basic_auth" {
  enabled          = true
  control_plane_id = var.control_plane_dev.id
  service = {
    id = konnect_gateway_service.httpbin.id
  }
  config = {
    hide_credentials = false
  }
}