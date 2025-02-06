terraform {
  required_version = ">= 1.0.0"

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = ">=0.32.0"
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

data "tfe_outputs" "aws-network" {
  organization = "sasano"
  workspace = "aws-network"
}

resource "hcp_vault_cluster" "vault-demo-cluster" {
  hvn_id          = data.tfe_outputs.aws-network.values.hvn
  cluster_id      = "${var.prefix}-hcp-vault-demo-cluster"
  public_endpoint = true
  tier            = var.vault-tier
}

resource "hcp_vault_cluster_admin_token" "vault-admin-token" {
  cluster_id = hcp_vault_cluster.vault-demo-cluster.cluster_id
}

