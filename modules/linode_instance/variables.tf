variable "region" {
  description = "Region to deploy Linode."
  type        = string
}

variable "instance_label" {
  description = "Label for the Linode instance."
  type        = string
}

variable "instance_type" {
  description = "Linode instance type."
  type        = string
}

variable "image" {
  description = "Linode image to use."
  type        = string
}

variable "root_pass" {
  description = "Root password for the Linode instance."
  type        = string
  sensitive   = true
}
