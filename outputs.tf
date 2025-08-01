output "linode_ip" {
  description = "The public IP address of the Linode instance."
  value       = module.linode_instance.ip_address
}

output "linode_id" {
  description = "The ID of the Linode instance."
  value       = module.linode_instance.id
}
