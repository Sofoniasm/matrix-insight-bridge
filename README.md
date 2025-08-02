# matrix-insight-bridge


This repository contains Terraform and Ansible code to provision a Matrix Synapse server on Akamai Linode, and automate the deployment of mautrix bridges for Instagram, WhatsApp, and Telegram using Docker.


## Features
- Modular Terraform structure
- Linode instance provisioning
- Easy variable configuration
- Automated Ansible/Docker deployment
- Matrix Synapse server with admin user automation
- mautrix-Instagram, mautrix-WhatsApp, and mautrix-Telegram bridges (all users allowed)

## Usage

### 1. Provision Linode VM with Terraform
1. Edit `variables.tf` to set your Linode API token, image, and root password.
2. Run:
   ```bash
   terraform init
   terraform apply
   ```


### 2. Configure Matrix Synapse and Bridges with Ansible
1. Edit `ansible/group_vars/all.yml` to set your domain, database credentials, and bridge tokens (Instagram, WhatsApp, Telegram).
2. Edit `ansible/hosts` to set your server IP and SSH user.
3. Run:
   ```bash
   cd ansible
   ansible-playbook -i hosts playbook.yml
   ```

#### Bridges Automated
- **mautrix-instagram**: Instagram-to-Matrix bridge (requires Instagram API keys)
- **mautrix-whatsapp**: WhatsApp-to-Matrix bridge (all users allowed)
- **mautrix-telegram**: Telegram-to-Matrix bridge (all users allowed)

All bridges are deployed as Docker containers and configured via Ansible. All Matrix users (new and old) can use WhatsApp and Telegram bridges by default.


#### Ansible Structure
- `ansible/playbook.yml`: Main playbook
- `ansible/group_vars/all.yml`: All variables (including bridge tokens)
- `ansible/hosts`: Inventory file
- `ansible/roles/docker`: Installs Docker
- `ansible/roles/postgres`: Runs Postgres container
- `ansible/roles/synapse`: Runs Synapse container, generates config, ensures Docker networks
- `ansible/roles/nginx`: Runs Nginx container for reverse proxy
- `ansible/roles/instagram`: Deploys mautrix-instagram bridge
- `ansible/roles/whatsapp`: Deploys mautrix-whatsapp bridge
- `ansible/roles/telegram`: Deploys mautrix-telegram bridge


## Next Steps
- Add DNS automation
- Secure your credentials and secrets
- Customize bridge configs as needed
- Update this README as you add more features

---

_This project is maintained by Sofoniasm._

### Admin and User Accounts

After running the Ansible playbook, you can register new users via the Element web GUI (registration is enabled by default).

#### Manual Admin User Creation (if needed)
If you want to create admin users from the command line, run the following inside your Synapse container:

```
docker exec -it synapse bash
register_new_matrix_user -u admin -p Testing1@2 -a -k "<your_registration_shared_secret>" http://localhost:8008
register_new_matrix_user -u bonb -p Testing1@2 -a -k "<your_registration_shared_secret>" http://localhost:8008
register_new_matrix_user -u clara -p Testing1@2 -a -k "<your_registration_shared_secret>" http://localhost:8008
register_new_matrix_user -u jimi -p Testing1@2 -a -k "<your_registration_shared_secret>" http://localhost:8008
register_new_matrix_user -u alex -p Testing1@2 -a -k "<your_registration_shared_secret>" http://localhost:8008
register_new_matrix_user -u tony -p Testing1@2 -a -k "<your_registration_shared_secret>" http://localhost:8008
```
Replace `<your_registration_shared_secret>` with the value from your `homeserver.yaml`.

All users have the password: `Testing1@2` and admin rights.

#### Troubleshooting
- If you see permission errors for log files, ensure all log file paths in your config are under `/data/`.
- If registration fails, check that `enable_registration: true` and `enable_registration_without_verification: true` are set in `homeserver.yaml`.
- If you change your domain, rerun the playbook to regenerate config and keys.
