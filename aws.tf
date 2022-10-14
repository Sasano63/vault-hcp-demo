resource "aws_vpc" "peering_vpc" {
  cidr_block = var.aws-cidr
    tags = {
    Name = "hcp vault peering vpc"
  }
}

resource "aws_internet_gateway" "vault-igw" {
  vpc_id = aws_vpc.peering_vpc.id

  tags = {
    Name = "hcp vault demo igw"
  }
}
