module "linode_instance" {
  source         = "./modules/linode_instance"
  region         = var.region
  instance_label = var.instance_label
  instance_type  = var.instance_type
  image          = var.image
  root_pass      = var.root_pass
}
