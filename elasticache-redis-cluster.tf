resource "aws_elasticache_replication_group" "this" {
  replication_group_id = format("%s-%s-elasticache", var.prefix, var.replication_group_id)
  replication_group_description = var.replication_group_description
  engine = var.engine
  engine_version = var.engine_version
  node_type = var.node_type
  port = var.port
  parameter_group_name = var.parameter_group_name
  automatic_failover_enabled = var.automatic_failover_enabled # must be set to true for native Redis cluster
  multi_az_enabled = var.multi_az_enabled
  apply_immediately = var.apply_immediately
  subnet_group_name = aws_elasticache_subnet_group.this.name # availablity_zones 를 직접 명시 할 수 없고 서브넷을 지정해서 Multi-AZ 구성, 값이 세팅되지 않으면 default subnet를 찾음
  kms_key_id = format("arn:aws:kms:%s:%s:key/%s", var.region, var.account_id, var.kms_key_id)
  at_rest_encryption_enabled = var.at_rest_encryption_enabled 
  snapshot_retention_limit = var.snapshot_retention_limit

  cluster_mode {
    replicas_per_node_group = var.replicas_per_node_group
    num_node_groups = var.num_node_groups
  }

  depends_on = [
    aws_elasticache_subnet_group.this
  ]

  lifecycle {
    ignore_changes = [number_cache_clusters]
  }

  tags = merge(var.tags, tomap({Name = format("%s.%s.elasticache", var.prefix, var.replication_group_id)}))
}

resource "aws_elasticache_subnet_group" "this" {
  name = format("%s-%s-sn", var.prefix, var.replication_group_id)
  subnet_ids = var.subnet_ids

  tags = merge(var.tags, tomap({Name = format("%s.%s.subnet-groups", var.prefix, var.replication_group_id)}))
}