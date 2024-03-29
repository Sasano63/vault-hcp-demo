variable "client-id" {
  description = "service-principal-key-client-id"
}
variable "client-secret" {
  description = "service-principal-key-client-secret"
}

variable "region" {
  description = "AWS region into which HCP Vault as well as AWS resources are to be deployed"
  default     = "eu-central-1"
}

variable "cidr-block" {
  default = "172.26.0.0/20"
}

variable "vault-tier" {
  description = "Tier of HCP Vault cluster"
  default     = "plus_small"
}

variable "aws-cidr" {
  default = "172.27.0.0/20"
}

variable "peer-id" {
  default = "dev"
}

variable "subnet-block1" {
  default = "172.27.1.0/24"
}

variable "subnet-block2" {
  default = "172.27.2.0/24"
}

variable "prefix" {
  type        = string
  description = "prefix to tag resources"
}

variable "key" {
  description = "keys to be used to access EC2 instance"
}

variable "ami" {
  description = "ID of AMI to be used, default is Amazon Linux"
  default     = "ami-05ff5eaef6149df49"
}