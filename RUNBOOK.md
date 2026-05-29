# StartTech Runbook

## Deployments

### Deploy Infrastructure
```bash
cd terraform
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### Deploy Frontend
```bash
cd Client
npm ci && npm run build
aws s3 sync dist/ s3://starttech-frontend-production-oluwakemi --delete
aws cloudfront create-invalidation --distribution-id E3O6Q3772748H1 --paths "/*"
```

### Deploy Backend
Push to feature/full-stack branch - GitHub Actions handles the rest.

## Troubleshooting

### Backend not responding
1. Check ALB target group health
2. Check docker logs: docker logs muchtodo-backend
3. Check CloudWatch logs at /starttech/backend

### High CPU
- CloudWatch alarm triggers scale-up automatically

### Database connection issues
- Verify MongoDB Atlas IP whitelist includes 0.0.0.0/0
- Check MONGO_URI environment variable on EC2

## Rollback
```bash
./scripts/rollback.sh <ecr-repo-url> <previous-image-tag>
```

## Cleanup
```bash
cd terraform
terraform destroy -var-file=terraform.tfvars
```
