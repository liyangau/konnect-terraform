# # Create a new Control Plane
resource "konnect_mesh_control_plane" "tf-global-cp" {
  count = var.exclude_mesh_control_plane ? 0 : 1
  name         = "tf-global-cp"
  description  = "This is the mesh control plane created by terraform"

  labels = {
      env         = "test"
      provisioner = "terraform"
  }
}