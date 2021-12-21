variable "account_id" {
  description = "Your account id"
  type = string
}

variable "region" {
  description = "AWS Region"
  type = string
  default = ""
}

variable "prefix" {
  description = "prefix for aws resources and tags"
  type = string
}

variable "replication_group_id" {
  description = "replication group identifier, required and lowercase"
  type = string
}

variable "replication_group_description" {
  description = "description for the replication group"
  type = string
}

variable "engine" {
  description = "AWS ElastiCache Engine Type"
  type = string
}

variable "engine_version" {
  description = "AWS ElastiCache Engine Version"
  type = string
}

variable "node_type" {
  description = "AWS ElastiCache Node Type"
  type = string
}

variable "port" {
  description = "AWS ElastiCache Usage Port"
  type = string
}

variable "parameter_group_name" {
  description = "Elasticache parameter group"
  type = string
}

variable "automatic_failover_enabled" {
  description = "must be set to true for native Redis cluster"
  type = bool
  default = true
}

variable "multi_az_enabled" {
  description = "Specifies whether to enable Multi-AZ Support for the replication group"
  type = bool
  default = true
}

variable "apply_immediately" {
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window"
  type = bool
  default = false
}

#variable "azs" {
#  description = "Availability Zone List"
#  type = list(string)
#}

variable "kms_key_id" {
  description = "The ARN of the key for encrypting at rest, Can be specified only if at_rest_encryption_enabled = true"
  type = string
}

variable "at_rest_encryption_enabled" {
  description = "Whether to enable encryption at rest"
  type = bool
  default = true
}

#variable "number_cache_clusters" {
#  description = "The number of cache clusters, If Multi-AZ is enabled, the value of this parameter must be at least 2"
#  type = string
#}

variable "replicas_per_node_group" {
  description = "Number of replica nodes in each node group(shards)"
  type = string
}

variable "num_node_groups" {
  description = "Number of node groups (shards)"
  type = string
}

variable "snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  type = string
  default = "7"
}

variable "subnet_ids" {
  description = "Subnet list for RDS Aurora"
  type = list(string)
}

variable "tags" {
  description = "tag map"
  type = map(string)
}