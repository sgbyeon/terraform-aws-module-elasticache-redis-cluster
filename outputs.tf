output "account_id" {
  description = "AWS Account ID"
  value = var.account_id
}

output "region" {
  description = "AWS region"
  value = var.region
}

output "subnet_ids" {
  description = "Elasticache redis subnet list"
  value = aws_elasticache_subnet_group.this.subnet_ids
}