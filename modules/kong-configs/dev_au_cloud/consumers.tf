# resource "konnect_gateway_consumer" "alice" {
#   username         = "alice"
#   control_plane_id = var.control_plane.id
# }

# resource "konnect_gateway_basic_auth" "alice_basicauth" {
#   username = var.alice_credentials.username
#   password = var.alice_credentials.password

#   consumer_id      = konnect_gateway_consumer.alice.id
#   control_plane_id = var.control_plane.id
# }

# resource "konnect_gateway_key_auth" "alice_keyauth" {
#   key              = var.alice_credentials.api_key
#   consumer_id      = konnect_gateway_consumer.alice.id
#   control_plane_id = var.control_plane.id
# }

# variable "alice_credentials" {
#   type = object({
#     api_key  = string
#     username = string
#     password = string
#   })

#   default = {
#     api_key  = "alice"
#     username = "alice"
#     password = "alice-pw"
#   }

#   sensitive = true
# }

# resource "konnect_gateway_consumer" "alex" {
#   username         = "alex"
#   control_plane_id = var.control_plane.id
# }

# resource "konnect_gateway_basic_auth" "alex_basicauth" {
#   username = var.alex_credentials.username
#   password = var.alex_credentials.password

#   consumer_id      = konnect_gateway_consumer.alex.id
#   control_plane_id = var.control_plane.id
# }

# resource "konnect_gateway_key_auth" "alex_keyauth" {
#   key              = var.alex_credentials.api_key
#   consumer_id      = konnect_gateway_consumer.alex.id
#   control_plane_id = var.control_plane.id
# }

# variable "alex_credentials" {
#   type = object({
#     api_key  = string
#     username = string
#     password = string
#   })

#   default = {
#     api_key  = "alex"
#     username = "alex"
#     password = "alex-pw"
#   }

#   sensitive = true
# }

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