# matrix-insight-bridge

This repository contains Terraform code to provision a Matrix Synapse server on Akamai Linode using best practices and modular design.

## Features
- Modular Terraform structure
- Linode instance provisioning
- Easy variable configuration
- Ready for Ansible/Docker post-provisioning

## Usage
1. Clone this repository.
2. Edit `variables.tf` to set your Linode API token, image, and root password.
3. Run:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
4. The instance will be created with your chosen settings.

## Variables
- `linode_token`: Your Linode API token (required)
- `region`: Linode region (default: us-east)
- `instance_label`: Instance label (default: Matrix)
- `instance_type`: Linode type (default: g6-standard-1)
- `image`: Linode image slug (default: linode/ubuntu22.04)
- `root_pass`: Root password (required)

## Outputs
- Instance ID
- Instance IP address

## Next Steps
- Use Ansible to configure Docker and systemd on the new instance.
- Update this README as you add more automation or features.

---

_This project is maintained by Sofoniasm._
