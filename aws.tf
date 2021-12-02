resource "aws_vpc" "peering_vpc" {
  cidr_block = var.aws-cidr
    tags = {
    Name = "hcp vault peering vpc"
  }
}