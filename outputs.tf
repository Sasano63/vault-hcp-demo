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

output "vpc" {
  value       = aws_vpc.peering_vpc.id
  description = "ID of the AWS VPC"
}

output "subnet1" {
  value = aws_subnet.subnet1.id
}

output "subnet2" {
  value = aws_subnet.subnet2.id
}

output "public_dns" {
  value = aws_instance.test-instance.public_dns
}