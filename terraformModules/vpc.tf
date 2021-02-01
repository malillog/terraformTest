resource "aws_vpc" "mivpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"

  tags = {
    Name = "mivpc"
  }
}

resource "aws_subnet" "subred1" {
  vpc_id     = aws_vpc.mivpc.id
  cidr_block = var.cidr_subnet1
  map_public_ip_on_launch = true
  tags = {
    Name = "misubnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mivpc.id

  tags = {
    Name = "main"
  }
}



resource "aws_route_table" "miTablaRoute" {
  vpc_id = aws_vpc.mivpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_main_route_table_association" "rtasociacion" {
  vpc_id         = aws_vpc.mivpc.id
  route_table_id = aws_route_table.miTablaRoute.id
}

