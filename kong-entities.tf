# Configure a service and a route that we can use to test
resource "konnect_gateway_service" "httpbin" {
  name             = "HTTPBin"
  protocol         = "https"
  host             = "httpbin.org"
  port             = 443
  path             = "/"
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_route" "test" {
  methods = ["GET"]
  name    = "Anything"
  paths   = ["/test"]

  strip_path = false

  control_plane_id = konnect_gateway_control_plane.tf-cp.id

  service = {
    id = konnect_gateway_service.httpbin.id
  }
}

# Secure the service with a basic-auth plugin
resource "konnect_gateway_plugin_basic_auth" "basic_auth" {
  enabled          = true
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
  service = {
    id = konnect_gateway_service.httpbin.id
  }
  config = {
    hide_credentials = false
  }
}

# Create a consumer and a basic auth credential for that consumer
resource "konnect_gateway_consumer" "alice" {
  username         = "alice"
  custom_id        = "alice"
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_basic_auth" "my_basicauth" {
  username = "alice-test"
  password = "demo"

  consumer_id      = konnect_gateway_consumer.alice.id
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}