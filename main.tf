terraform {
  required_version = ">= 1.0.0"

  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.20.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45.0"
    }
  }
}

provider "hcp" {
  client_id     = var.client-id
  client_secret = var.client-secret
}

provider "aws" {
  region = var.region
}

resource "hcp_hvn" "vault-demo-hvn" {
  hvn_id         = "vault-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = var.cidr-block
}

resource "hcp_vault_cluster" "vault-demo-cluster" {
  hvn_id     = hcp_hvn.vault-demo-hvn.hvn_id
  cluster_id = "hcp-tf-vault-demo-cluster"
  public_endpoint = true
  tier = var.vault-tier
}

resource "hcp_vault_cluster_admin_token" "vault-admin-token" {
  cluster_id = hcp_vault_cluster.vault-demo-cluster.cluster_id
}

resource "hcp_aws_network_peering" "vault-peering" {
  hvn_id          = hcp_hvn.vault-demo-hvn.hvn_id
  peer_vpc_id     = aws_vpc.peering_vpc.id
  peer_account_id = aws_vpc.peering_vpc.owner_id
  peer_vpc_region = var.region
}

resource "hcp_hvn_route" "vault-hvn-route" {
  hvn_link         = hcp_hvn.vault-demo-hvn.self_link
  destination_cidr = aws_vpc.peering_vpc.cidr_block
  target_link      = hcp_aws_network_peering.vault-peering.self_link
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.vault-peering.provider_peering_id
  auto_accept               = true
}