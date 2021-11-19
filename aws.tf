resource "aws_vpc" "peering_vpc" {
  cidr_block = var.aws-cidr
}