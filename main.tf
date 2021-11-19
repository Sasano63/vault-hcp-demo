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

resource "hcp_vault_cluster" "vault_demo_cluster" {
  hvn_id     = hcp_hvn.vault-demo-hvn.vault-hvn
  cluster_id = "hcp-tf-vault_demo_cluster"
}

resource "hcp_vault_cluster_admin_token" "vault_admin_token" {
  cluster_id = hcp_vault_cluster.vault_demo_cluster.hcp-tf-vault_demo_cluster
}