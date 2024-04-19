resource "konnect_gateway_control_plane" "tf-cp" {
  name         = "tf-cp"
  description  = "This is the first control plane created by terraform"
  cluster_type = "CLUSTER_TYPE_CONTROL_PLANE"
  auth_type    = "pki_client_certs"

  labels = {
    env         = "test"
    provisioner = "terraform"
  }
}

resource "konnect_gateway_control_plane" "tf-test-cp" {
  name         = "tf-test-cp"
  description  = "This is the first control plane created by terraform"
  cluster_type = "CLUSTER_TYPE_CONTROL_PLANE"
  auth_type    = "pki_client_certs"

  labels = {
    env         = "test"
    provisioner = "terraform"
  }
}

resource "konnect_gateway_control_plane" "tf-k8s-cp" {
  name         = "tf-k8s-cp"
  description  = "This is the K8S control plane created by terraform"
  cluster_type = "CLUSTER_TYPE_K8S_INGRESS_CONTROLLER"
  auth_type    = "pki_client_certs"

  labels = {
    env         = "test"
    provisioner = "terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}