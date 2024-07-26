resource "konnect_gateway_service" "echo" {
  name             = "echo-svc"
  protocol         = "http"
  host             = "echo"
  port             = 8080
  path             = "/"
  control_plane_id = var.control_plane.id
}

resource "konnect_gateway_route" "echo" {
  methods = ["GET"]
  name    = "echo-route"
  paths   = ["/echo"]

  strip_path = false

  control_plane_id = var.control_plane.id

  service = {
    id = konnect_gateway_service.echo.id
  }
}

