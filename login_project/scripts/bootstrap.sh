#!/bin/bash

# Provide AWS Access key and secret access key in below commands
# export AWS_ACCESS_KEY_ID="your_aws_access_key"
# export AWS_SECRET_ACCESS_KEY="your_aws_secret_key"
# export AWS_DEFAULT_REGION="us-east-1"

echo "Step 1: Generate SSH key"
bash scripts/create_terraform_key.sh
echo "Step 2: Run Terraform"
cd terraform/
terraform init
terraform apply -auto-approve
cd ..
echo "Step 3: Generate ansible inventory"
chmod +x scripts/generate_inventory.sh
bash scripts/generate_inventory.sh
