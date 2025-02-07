output "primary_vault_public_endpoint_url" {
  value       = hcp_vault_cluster.vault-demo-cluster.vault_public_endpoint_url
  description = "The public IP address of the cluster."
}

output "primary_vault_private_endpoint_url" {
  value       = hcp_vault_cluster.vault-demo-cluster.vault_private_endpoint_url
  description = "The private IP address of the cluster."
}

output "namespace" {
  value       = hcp_vault_cluster.vault-demo-cluster.namespace
  description = "The default namespace of the cluster."
}

output "primary_token" {
  value       = hcp_vault_cluster_admin_token.vault-admin-token.token
  description = "Token"
  sensitive   = true
}

output "cluster_id" {
  value = hcp_vault_cluster.vault-demo-cluster.cluster_id
  description = "ID of the HCP Vault cluster"
}

/* output "public_dns" {
  value = aws_instance.test-instance.public_dns
} */