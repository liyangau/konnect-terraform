resource "konnect_gateway_consumer" "alice" {
  username         = "alice"
  custom_id        = "alice"
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_basic_auth" "alice_basicauth" {
  username = var.alice_credentials.username
  password = var.alice_credentials.password

  consumer_id      = konnect_gateway_consumer.alice.id
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

resource "konnect_gateway_key_auth" "alice_keyauth" {
  key              = var.alice_credentials.api_key
  consumer_id      = konnect_gateway_consumer.alice.id
  control_plane_id = konnect_gateway_control_plane.tf-cp.id
}

variable "alice_credentials" {
  type = object({
    api_key  = string
    username = string
    password = string
  })

  default = {
    api_key  = "alice"
    username = "alice-test"
    password = "demo"
  }

  sensitive = true
}