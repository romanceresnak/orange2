resource "aws_security_group" "app" {
  name        = "${var.vpc_name}-app-sg"
  vpc_id      = var.vpc_id
  description = "App Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }
}

resource "aws_security_group" "db" {
  name        = "${var.vpc_name}-db-sg"
  vpc_id      = var.vpc_id
  description = "DB Security Group"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }
}
