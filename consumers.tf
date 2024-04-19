resource "konnect_gateway_consumer" "alice" {
  username         = "alice"
  custom_id = "alice"
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_basic_auth" "alice_basicauth" {
  username = "alice-test"
  password = "demo"

  consumer_id      = konnect_gateway_consumer.alice.id
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_consumer" "alex" {
  username         = "alex"
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_basic_auth" "alex_basicauth" {
  username = "alex-test"
  password = "test"

  consumer_id      = konnect_gateway_consumer.alex.id
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}