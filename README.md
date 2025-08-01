# matrix-insight-bridge

This repository contains Terraform code to provision a Matrix Synapse server on Akamai Linode using best practices and modular design.

## Features
- Modular Terraform structure
- Linode instance provisioning
- Easy variable configuration
- Ready for Ansible/Docker post-provisioning

## Usage

### 1. Provision Linode VM with Terraform
1. Edit `variables.tf` to set your Linode API token, image, and root password.
2. Run:
   ```bash
   terraform init
   terraform apply
   ```

### 2. Configure Matrix Synapse with Ansible
1. Edit `ansible/group_vars/all.yml` to set your domain, database credentials, etc.
2. Edit `ansible/hosts` to set your server IP and SSH user.
3. Run:
   ```bash
   cd ansible
   ansible-playbook -i hosts playbook.yml
   ```

#### Ansible Structure
- `ansible/playbook.yml`: Main playbook
- `ansible/group_vars/all.yml`: All variables
- `ansible/hosts`: Inventory file
- `ansible/roles/docker`: Installs Docker
- `ansible/roles/postgres`: Runs Postgres container
- `ansible/roles/synapse`: Runs Synapse container, generates config, ensures Docker networks

## Next Steps
- Add admin user creation and DNS automation
- Secure your credentials and secrets
- Update this README as you add more features

---

_This project is maintained by Sofoniasm._
