variable "system_token" {
  type        = string
  sensitive   = true
  description = "Token to be used to communicate with Konnect"
}

variable "cp_region" {
  type        = string
  description = "The region where the operation will be performed"
}

variable "exclude_mesh_control_plane" {
  type        = bool
  description = "flag to exclude mesh control plane to be created"
}