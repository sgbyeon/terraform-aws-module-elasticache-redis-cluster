resource "aws_security_group" "this" {
  name = format("%s.%s.elasticache.security-groups", var.prefix, var.replication_group_id)
  vpc_id = var.vpc_id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, tomap({Name = format("%s.%s.elasticache.security-groups", var.prefix, var.replication_group_id)}))
}

resource "aws_security_group_rule" "this" {
  type = "ingress"
  from_port = 6379
  to_port = 6379
  protocol = "tcp"
  cidr_blocks = var.cidr
  security_group_id = aws_security_group.this.id
}