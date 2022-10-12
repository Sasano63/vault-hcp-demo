resource "aws_vpc" "peering_vpc" {
  cidr_block = var.aws-cidr
    tags = {
    Name = "hcp vault peering vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.peering_vpc.id
  cidr_block = var.subnet-block1

  tags = {
    Name = "Peering VPC Subnet 1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.peering_vpc.id
  cidr_block = var.subnet-block2

  tags = {
    Name = "Peering VPC Subnet 2"
  }
}