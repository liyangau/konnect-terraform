variable "system_token" {
  type      = string
  sensitive = true
}

variable "cp_region" {
  type = string
}

variable "exclude_mesh_control_plane" {
  type = bool
}