resource "aws_security_group" "this" {
  name = format("%s.%s.aurora.security-groups", var.prefix, var.cluster_name)
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

  tags = merge(var.tags, tomap({Name = format("%s.%s.aurora.security-groups", var.prefix, var.cluster_name)}))
}

resource "aws_security_group_rule" "this" {
  type = "ingress"
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  cidr_blocks = var.cidr
  security_group_id = aws_security_group.this.id
}