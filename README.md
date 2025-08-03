# matrix-insight-bridge



This repository contains Terraform and Ansible code to provision a Matrix Synapse server on Akamai Linode, and fully automate the deployment of the mautrix-whatsapp bridge using Docker. All unnecessary bridges (Instagram, Telegram) and their databases have been removed. The setup is one-command automated, secure (Let's Encrypt SSL), and production-ready.


## Features
- Modular Terraform structure
- Linode instance provisioning
- Easy variable configuration
- Automated Ansible/Docker deployment
- Matrix Synapse server with admin user automation
- mautrix-WhatsApp bridge (all users allowed)

## Usage


## Quick Start: Fully Automated WhatsApp-Matrix Bridge

### 1. Provision Linode VM with Terraform
1. Edit `variables.tf` to set your Linode API token, image, and root password.
2. Run:
   ```bash
   terraform init
   terraform apply
   ```

### 2. Configure Matrix Synapse and WhatsApp Bridge with Ansible
1. Edit `ansible/group_vars/all.yml` to set your domain, WhatsApp bridge tokens, and database credentials.
2. Edit `ansible/hosts` to set your server IP and SSH user/password.
3. Run:
   ```bash
   cd ansible
   ansible-playbook -i hosts playbook.yml
   ```

#### What gets deployed
- **Matrix Synapse**: Secure, production-ready homeserver (Docker)
- **mautrix-whatsapp**: WhatsApp-to-Matrix bridge (Docker, fully automated)
- **Postgres**: Database for Synapse and WhatsApp bridge
- **Nginx**: Reverse proxy with Let's Encrypt SSL (auto-renewed)

All configuration, registration, and Docker networking is handled automatically. No manual file editing or container restarts are needed.



#### Ansible Structure
- `ansible/playbook.yml`: Main playbook
- `ansible/group_vars/all.yml`: All variables (including WhatsApp bridge tokens)
- `ansible/hosts`: Inventory file
- `ansible/roles/docker`: Installs Docker
- `ansible/roles/postgres`: Runs Postgres container
- `ansible/roles/synapse`: Runs Synapse container, generates config, ensures Docker networks
- `ansible/roles/nginx`: Runs Nginx container for reverse proxy and SSL
- `ansible/roles/whatsapp`: Deploys mautrix-whatsapp bridge



## Step-by-Step: What Happens
1. **Terraform** provisions a Linode VM and outputs its IP.
2. **Ansible**:
   - Installs Docker, Postgres, Synapse, Nginx, and mautrix-whatsapp
   - Sets up Docker networks for secure container communication
   - Renders all configs and registration files automatically
   - Ensures WhatsApp bridge registration is always in sync with Synapse
   - Automates Let's Encrypt SSL for Nginx
   - Starts all containers and verifies health
   - Registers admin users (see below)

## Admin and User Accounts
After running the Ansible playbook, you can register new users via the Element web GUI (registration is enabled by default).

#### Manual Admin User Creation (if needed)
If you want to create admin users from the command line, run the following inside your Synapse container:

```
docker exec -it synapse bash
register_new_matrix_user -u admin -p Testing1@2 -a -k "<your_registration_shared_secret>" http://localhost:8008
```
Replace `<your_registration_shared_secret>` with the value from your `homeserver.yaml`.

All users have the password: `Testing1@2` and admin rights.

## Troubleshooting
- If you see permission errors for log files, ensure all log file paths in your config are under `/data/`.
- If registration fails, check that `enable_registration: true` and `enable_registration_without_verification: true` are set in `homeserver.yaml`.
- If you change your domain, rerun the playbook to regenerate config and keys.

---

_This project is maintained by Sofoniasm._

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
