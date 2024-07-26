variable "gateway_cps" {
  type = map(object({
    name          = string
    auth_type     = optional(string, "pki_client_certs")
    type          = optional(string, "")
    cloud_gateway = optional(bool, false)
    description   = optional(string, "")
    labels        = optional(map(string), {})
  }))
  description = "Gateway control planes configurations"

  validation {
    condition = alltrue([
      for name, cp in var.gateway_cps : 
        !cp.cloud_gateway || (cp.cloud_gateway && cp.auth_type == "pinned_client_certs")
    ])
    error_message = "When cloud_gateway is true, auth_type must be 'pinned_client_certs'."
  }

  validation {
    condition = alltrue([
      for name, cp in var.gateway_cps :
        contains(["pinned_client_certs", "pki_client_certs"], cp.auth_type)
    ])
    error_message = "The auth_type must be either 'pinned_client_certs' or 'pki_client_certs'."
  }

  validation {
    condition = alltrue([
      for name, cp in var.gateway_cps :
        cp.type == "" || contains([
          "CLUSTER_TYPE_CONTROL_PLANE",
          "CLUSTER_TYPE_K8S_INGRESS_CONTROLLER",
          "CLUSTER_TYPE_CONTROL_PLANE_GROUP"
        ], cp.type)
    ])
    error_message = "The control plane type (if provided) must be 'CLUSTER_TYPE_CONTROL_PLANE', 'CLUSTER_TYPE_K8S_INGRESS_CONTROLLER', or 'CLUSTER_TYPE_CONTROL_PLANE_GROUP'."
  }
}

locals {
  control_plane_with_labels = {
    for name, cp in var.gateway_cps : name => merge(cp, {
      labels = merge(
        { provisioner = "terraform" },
        cp.labels
      )
    })
  }
}