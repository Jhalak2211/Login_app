#!/bin/bash
# Define key path
KEY_DIR="terraform/"
KEY_NAME="id_rsa"
rm -rf terraform/id_rsa*
# Create directory if not exists
echo "creating key"
mkdir -p "$KEY_DIR"
# Generate SSH key pair
ssh-keygen -t rsa -b 4096 -f "$KEY_DIR/$KEY_NAME" -N ""
# echo "SSH key pair generated at $KEY_DIR/$KEY_NAME"
