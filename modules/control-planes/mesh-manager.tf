resource "konnect_mesh_control_plane" "tf_global_cp" {
  name        = "tf-global-cp"
  description = "This is the mesh control plane created by terraform"

  labels = {
    provisioner = "terraform"
  }
}
