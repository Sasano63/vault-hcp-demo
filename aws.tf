resource "aws_vpc" "peering_vpc" {
  cidr_block = var.aws-cidr
    tags = {
    Name = "hcp vault peering vpc"
  }
}

resource "aws_subnet" "peering_vpc_subnet" {
  vpc_id     = aws_vpc.peering_vpc.id
  cidr_block = "var.aws-cidr"

  tags = {
    Name = "Peering VPC Subnet"
  }
}