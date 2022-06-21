variable "client-id" {
    description = "service-principal-key-client-id"
}
variable "client-secret" {
    description = "service-principal-key-client-secret"
}

variable "region" {
    description = "AWS region into which HCP Vault as well as AWS resources are to be deployed"
    default = "eu-central-1"
}

variable "cidr-block" {
    default = "172.26.0.0/20"
}

variable "vault-tier" {
    description = "Tier of HCP Vault cluster"
    default = "plus_small"
}

variable "aws-cidr" {
        default = "172.27.0.0/20"
}

variable "peer-id" {
       default = "dev"
}
