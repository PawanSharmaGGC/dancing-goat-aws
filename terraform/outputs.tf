output "alb_dns_name" {
  value = module.alb.dns_name
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}
