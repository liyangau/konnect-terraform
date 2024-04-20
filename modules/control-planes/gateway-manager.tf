resource "konnect_gateway_control_plane" "cps" {
  for_each = local.gateway_cps
  name = each.key
  description  = "This is the first control plane created by terraform"
  cluster_type = each.value.type
  auth_type    = "pki_client_certs"

  labels = {
    Name = each.key
    provisioner = "terraform"
  }
}