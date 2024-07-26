### In case we need to exclude some CPs
# locals {
#   excluded_instance = ["dev"]
# }
###

resource "konnect_gateway_data_plane_client_certificate" "fomm_rsa_root_ca" {
  # for_each = konnect_gateway_control_plane.cps
  ### In case we need to exclude some CPs
  # for_each = {
  #   for k, v in konnect_gateway_control_plane.cps : k => v
  #   if !contains(local.excluded_names, v.name)
  # }
  ###
  for_each = {
    for name, cp in konnect_gateway_control_plane.cps :
    name => cp if cp.auth_type == "pki_client_certs"
  }
  cert = <<-EOF
-----BEGIN CERTIFICATE-----
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
-----END CERTIFICATE-----
EOF
  control_plane_id = each.value.id
}