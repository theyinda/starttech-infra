# StartTech Infrastructure

## Overview
Terraform infrastructure for the StartTech application on AWS.

## Architecture
- VPC with public and private subnets across 2 AZs
- Application Load Balancer in public subnets
- Auto Scaling Group of EC2 instances in private subnets
- ElastiCache Redis cluster for caching
- S3 + CloudFront for frontend hosting
- ECR for Docker images
- CloudWatch for monitoring and logging

## Prerequisites
- Terraform v1.3+
- AWS CLI configured
- MongoDB Atlas cluster

## Deployment

### 1. Set up variables
```bash
cp terraform/terraform.tfvars.example terraform/terraform.tfvars
# Fill in your values
```

### 2. Deploy
```bash
./scripts/deploy-infrastructure.sh
```

### 3. GitHub Actions Setup
Add these secrets to your repository:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- MONGO_URI
- JWT_SECRET
- KEY_PAIR_NAME
- MY_IP_ADDRESS

## Cleanup
```bash
cd terraform && terraform destroy
```
