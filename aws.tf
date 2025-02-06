/* resource "aws_vpc" "peering_vpc" {
  cidr_block           = var.aws-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "hcp vault peering vpc"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.peering_vpc.id
  cidr_block        = var.subnet-block1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.prefix}-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.peering_vpc.id
  cidr_block        = var.subnet-block2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.prefix}-subnet2"
  }
}

resource "aws_internet_gateway" "vault-igw" {
  vpc_id = aws_vpc.peering_vpc.id

  tags = {
    Name = "hcp vault demo igw"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.peering_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vault-igw.id
  }

  route {
    cidr_block                = var.cidr-block
    vpc_peering_connection_id = hcp_aws_network_peering.vault-peering.provider_peering_id
  }
  tags = {
    Name = "vault RTB"
  }
}

resource "aws_route_table_association" "rtb_subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_route_table_association" "rtb_subnet2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_default_security_group" "default_sg_vpc" {
  vpc_id = aws_vpc.peering_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}





 */