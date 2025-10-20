#!/bin/bash
# scripts/generate_inventory.sh
# This script generates an Ansible inventory file using Terraform outputs.

INVENTORY_FILE="ansible/inventory.ini"
cd terraform
# Fetch Terraform outputs
controller_ip=$(terraform output -raw controller_ip)
manager_ip=$(terraform output -raw manager_ip)
worker_a_ip=$(terraform output -raw worker_a_ip)
worker_b_ip=$(terraform output -raw worker_b_ip)
cd ..
# Go back to project root and create ansible folder if not exists
mkdir -p ansible

# Generate inventory file
cat > "$INVENTORY_FILE" <<EOF
[controller]
${controller_ip} ansible_user=ubuntu ansible_ssh_private_key_file=terraform/id_rsa

[manager]
${manager_ip} ansible_user=ubuntu ansible_ssh_private_key_file=terraform/id_rsa

[workers]
${worker_a_ip} ansible_user=ubuntu ansible_ssh_private_key_file=terraform/id_rsa
${worker_b_ip} ansible_user=ubuntu ansible_ssh_private_key_file=terraform/id_rsa

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOF

echo "✅ Ansible inventory file generated at $INVENTORY_FILE"
