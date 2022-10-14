resource "aws_vpc" "peering_vpc" {
  cidr_block = var.aws-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
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

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.peering_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vault-igw.id
  }
   tags = {
    Name = "Vault public RTB"
  } 
}

#open SG not safe, only for demonstration purposes
resource "aws_default_security_group" "default_sg_vpc" {
  vpc_id = aws_vpc.peering_vpc.id

  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   from_port   = 8080
  #   to_port     = 8080
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  #   ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  #   ingress {
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}