resource "aws_vpc" "my_vpc" {
  cidr_block = var.my_vpc_cidr_block // "12.11.0.0/16"
  tags = {
    Name = var.my_vpc_tags // "my_vpc"
  }
}
resource "aws_subnet" "my_subnet_pub" {
  vpc_id                  = aws_vpc.my_vpc.id  
  availability_zone       = "us-east-1a"
  cidr_block              = var.my_subnet_pub_cidr_block // "12.11.0.0/17"
  map_public_ip_on_launch = var.my_subnet_pub_map_ip // true
  tags = {
    Name = var.my_subnet_pub_tags // "pub_subnet"
  }
}
resource "aws_subnet" "my_subnet_private1" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = var.my_subnet_private1_cidr_block // "12.11.128.0/19"
  map_public_ip_on_launch = var.my_subnet_private_map_ip // false
  tags = {
    Name = var.my_subnet_private1_tags // "pri_subnet1"
  }
}

resource "aws_subnet" "my_subnet_private2" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = var.my_subnet_private2_cidr_block // "12.11.192.0/20"
  map_public_ip_on_launch = var.my_subnet_private_map_ip // false
  tags = {
    Name = var.my_subnet_private2_tags // "pri_subnet2"
  }
}
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.my_igw_tags
  }
}
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

    route {
    cidr_block = var.my_def_Route_example_cidr_block // "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = var.my_def_Route_example_tag // "default"
  }
}
resource "aws_route_table_association" "my_rw_association" {
  subnet_id      = aws_subnet.my_subnet_pub.id
  route_table_id = aws_route_table.my_route_table.id
}