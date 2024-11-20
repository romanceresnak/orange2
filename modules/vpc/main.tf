resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count                  = length(var.public_subnets)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.public_subnets[count.index]
  availability_zone      = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count                  = length(var.private_subnets)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.private_subnets[count.index]
  availability_zone      = element(var.availability_zones, count.index)
  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  count        = length(var.public_subnets)
  subnet_id    = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
