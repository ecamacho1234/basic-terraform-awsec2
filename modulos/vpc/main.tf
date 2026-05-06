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