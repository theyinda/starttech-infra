output "alb_dns_name" { value = aws_lb.main.dns_name }
output "ecr_repository_url" { value = aws_ecr_repository.backend.repository_url }
output "elasticache_endpoint" { value = aws_elasticache_cluster.redis.cache_nodes[0].address }
output "asg_name" { value = aws_autoscaling_group.backend.name }
output "scale_up_policy_arn" { value = aws_autoscaling_policy.scale_up.arn }
output "scale_down_policy_arn" { value = aws_autoscaling_policy.scale_down.arn }
