output "vpc_id" {
  description = "Identifiant de la VPC créée."
  value       = module.network.vpc_id
}

output "security_group_id" {
  description = "Identifiant du Security Group d'administration."
  value       = module.network.admin_security_group_id
}

output "data_bucket_name" {
  description = "Nom du bucket S3 de données."
  value       = aws_s3_bucket.data.bucket
}
