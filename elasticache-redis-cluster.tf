resource "aws_elasticache_replication_group" "this" {
  replication_group_id = var.replication_group_id
  replication_group_description = var.replication_group_description
  engine = var.engine
  engine_version = var.engine_version
  node_type = var.node_type
  port = var.port
  parameter_group_name = var.parameter_group_name
  automatic_failover_enabled = var.automatic_failover_enabled # must be set to true for native Redis cluster
  multi_az_enabled = var.multi_az_enabled
  apply_immediately = var.apply_immediately
  availability_zones = var.azs
  kms_key_id = var.kms_key_id
  at_rest_encryption_enabled = var.at_rest_encryption_enabled 
  number_cache_clusters = var.number_cache_clusters

  cluster_mode {
    replicas_per_node_group = var.replicas_per_node_group
    num_node_groups = var.num_node_groups
  }

  depends_on = [
    aws_elasticache_subnet_group.this
  ]

  tags = merge(var.tags, tomap({Name = format("%s-%s-ec", var.prefix, var.replication_group_id)}))
}

resource "aws_elasticache_subnet_group" "this" {
  name = format("%s-%s-sn", var.prefix, var.cluster_name)
  subnet_ids = var.subnet_ids

  tags = merge(var.tags, tomap({Name = format("%s-%s-sng", var.prefix, var.cluster_name)}))
}