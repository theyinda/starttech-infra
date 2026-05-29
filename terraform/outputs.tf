output "vpc_id" {
  value = module.networking.vpc_id
}

output "alb_dns_name" {
  value = module.compute.alb_dns_name
}

output "s3_bucket_name" {
  value = module.storage.s3_bucket_name
}

output "cloudfront_domain" {
  value = module.storage.cloudfront_domain
}

output "ecr_repository_url" {
  value = module.compute.ecr_repository_url
}

output "elasticache_endpoint" {
  value = module.compute.elasticache_endpoint
}
