locals {
  gateway_cps = {
    "dev" = {
      type = "CLUSTER_TYPE_CONTROL_PLANE"
    },
    "staging" = {
      type = "CLUSTER_TYPE_CONTROL_PLANE"
    },
    "home_cluster" = {
      type = "CLUSTER_TYPE_K8S_INGRESS_CONTROLLER"
    },
  }
}