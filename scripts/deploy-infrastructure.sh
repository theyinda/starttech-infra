#!/bin/bash
set -e

echo "Deploying StartTech Infrastructure..."

cd terraform

echo "Initializing Terraform..."
terraform init

echo "Validating configuration..."
terraform validate

echo "Planning deployment..."
terraform plan -var-file=terraform.tfvars

echo "Applying infrastructure..."
terraform apply -auto-approve -var-file=terraform.tfvars

echo "Infrastructure deployed successfully!"
terraform output
