variable "region" {
  type = string
  description = "AWS region that cloud gateway and network should be created"
}

variable "network_name" {
  type = string
  description = "Konnect Network name"
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed for access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
  
  validation {
    condition     = length(var.allowed_cidr_blocks) < 5
    error_message = "The allowed_cidr_blocks list must contain fewer than 5 elements."
  }

  validation {
    condition     = can([for cidr in var.allowed_cidr_blocks : cidrhost(cidr, 0)])
    error_message = "One or more CIDR blocks are invalid. Please provide valid CIDR notation, e.g., '10.0.0.0/8'."
  }
}

variable "cidr_block" {
  type    = string
  default = "192.168.0.0/16"
  description = "CIDR block for Cloud Gateway network"
}

variable "ddos_protection" {
  type    = bool
  default = false
  description = "Whether DDOS protection is enabled for the network"
}
