output "id" {
  description = "The ID of the Linode instance."
  value       = linode_instance.this.id
}

output "ip_address" {
  description = "The public IP address of the Linode instance."
  value       = join(",", linode_instance.this.ipv4)
}
