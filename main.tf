terraform {
  required_version = ">= 1.0.0"

  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.20.0"
    }
  }
}

provider "hcp" {
  client_id     = var.client-id
  client_secret = var.client-secret
}

resource "hcp_hvn" "vault-demo-hvn" {
  hvn_id         = "vault-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = var.cidr_block
}