locals {
  user_apikeys = jsondecode(file("${path.module}/apikeys.json"))
}

resource "konnect_gateway_consumer" "users" {
  for_each         = local.user_apikeys
  username         = each.key
  control_plane_id = var.control_plane.id
}

resource "konnect_gateway_key_auth" "user_apikeys" {
  for_each         = local.user_apikeys
  key              = sensitive(each.value)
  consumer_id      = konnect_gateway_consumer.users[each.key].id
  control_plane_id = var.control_plane.id
}