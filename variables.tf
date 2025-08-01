variable "linode_token" {
  description = "Linode API token."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Region to deploy Linode."
  type        = string
  default     = "us-east"
}

variable "instance_label" {
  description = "Label for the Linode instance."
  type        = string
  default     = "Matrix"
}

variable "instance_type" {
  description = "Linode instance type."
  type        = string
  default     = "g6-standard-1"
}

variable "image" {
  description = "Linode image to use. Edit this value to your preferred image slug."
  type        = string
  default     = "linode/ubuntu22.04"
}

variable "root_pass" {
  description = "Root password for the Linode instance. Edit this value or provide via tfvars or prompt."
  type        = string
  sensitive   = true
  default     = "Testing1@ECX.COM" # Uncomment and set your password here
}
