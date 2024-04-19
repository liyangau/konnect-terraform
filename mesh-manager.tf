# # Create a new Control Plane
resource "konnect_mesh_control_plane" "tf-global-cp" {
  count       = 0
  name        = "tf-global-cp"
  description = "This is the mesh control plane created by terraform"

  labels = {
    env         = "test"
    provisioner = "terraform"
  }
}
