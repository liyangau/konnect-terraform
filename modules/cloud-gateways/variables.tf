variable "name" {
  type = string
  description = "Identifier used for creating newtwork"
}

variable "region" {
  type = string
  description = "AWS region that cloud gateway and network should be created"
}

variable "api_access" {
  type = string
  default = "private+public"
}

variable "custom_domain" {
  type = string
  description = "Domain name to be used for custom_domain of cloud gateway"
}

variable "control_plane_geo" {
  type = string
  description = "The region Konnect Control plane sits"
}

variable "control_plane_id" {
  type = string
  description = "Konnect Control plane ID"
}

variable "control_plane_name" {
  type = string
  description = "Konnect Control Plane name, used to create public edge DNS"
}

variable "kong_version" {
  type = string
  default = "3.7"
  description = "Kong version this cloud gateway is running"
}

variable "network_id" {
  type = string
  description = "The konnect network id that cloud gateway will run in"
}