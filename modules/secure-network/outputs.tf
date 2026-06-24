output "vpc_id" {
  description = "Identifiant de la VPC."
  value       = aws_vpc.this.id
}

output "admin_security_group_id" {
  description = "Identifiant du Security Group d'administration."
  value       = aws_security_group.admin.id
}

output "flow_log_group" {
  description = "Groupe de logs CloudWatch des VPC Flow Logs."
  value       = aws_cloudwatch_log_group.flow_logs.name
}
