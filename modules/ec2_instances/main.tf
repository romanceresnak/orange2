resource "aws_instance" "app" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.security_group_id]

  tags = {
    Name = "${var.vpc_name}-app-${count.index + 1}"
  }
}
