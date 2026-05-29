# StartTech Architecture

## Overview
Internet → CloudFront → S3 (Frontend)
Internet → ALB → ASG EC2 (Backend) → MongoDB Atlas
↓
ElastiCache Redis
↓
CloudWatch Logs

## Components

### Frontend
- React app built with Vite
- Hosted on S3 as static website
- Delivered via CloudFront CDN globally

### Backend
- Golang API running on EC2 instances
- Auto Scaling Group (min 1, max 3, desired 2)
- Behind Application Load Balancer
- Docker container pulled from ECR

### Database
- MongoDB Atlas free tier in us-east-1
- Accessible from EC2 via connection string

### Caching
- ElastiCache Redis cache.t3.micro
- Used for session storage and API caching

### Networking
- VPC: 10.0.0.0/16
- Public subnets: ALB, NAT Gateways
- Private subnets: EC2, ElastiCache

### Monitoring
- CloudWatch Log Groups for backend logs
- CPU alarms triggering auto scaling
- ALB request count metrics
