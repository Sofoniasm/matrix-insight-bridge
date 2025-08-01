terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

resource "linode_instance" "this" {
  label      = var.instance_label
  region     = var.region
  type       = var.instance_type
  image      = var.image
  root_pass  = var.root_pass
  # Optionally add SSH keys, tags, etc.
}
