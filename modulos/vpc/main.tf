resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
    
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.private_subnet
  tags = {
    "Name" = var.private_subnet_name
  }
  depends_on = [
    aws_subnet.public
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.cidr_route_table
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_crt_name
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_crt.id
}