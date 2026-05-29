#!/bin/bash
yum update -y
yum install -y docker aws-cli

systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Install CloudWatch agent
yum install -y amazon-cloudwatch-agent

# Login to ECR
aws ecr get-login-password --region ${aws_region} | docker login --username AWS --password-stdin ${ecr_repository_url}

# Pull and run the backend
docker pull ${ecr_repository_url}:latest

docker run -d \
  --name muchtodo-backend \
  --restart always \
  -p 8080:8080 \
  -e MONGO_URI="${mongo_uri}" \
  -e JWT_SECRET_KEY="${jwt_secret}" \
  -e REDIS_ADDR="${redis_endpoint}:6379" \
  -e PORT=8080 \
  -e LOG_FORMAT=json \
  -e LOG_LEVEL=INFO \
  ${ecr_repository_url}:latest

# Start CloudWatch agent
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config -m ec2 -s \
  -c ssm:/starttech/cloudwatch-config
