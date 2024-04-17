# # Create a new Control Plane
resource "konnect_gateway_control_plane" "tf-cp" {
  name         = "tf-cp"
  description  = "This is the first control plane created by terraform"
  cluster_type = "CLUSTER_TYPE_HYBRID"
  auth_type    = "pki_client_certs"
  
  labels = jsonencode({
      env         = "test"
      provisioner = "terraform"
  })
}