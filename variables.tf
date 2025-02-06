variable "client-id" {
  description = "service-principal-key-client-id"
}
variable "client-secret" {
  description = "service-principal-key-client-secret"
}

variable "vault-tier" {
  description = "Tier of HCP Vault cluster"
  default     = "plus_small"
}

variable "prefix" {
  type        = string
  description = "prefix to tag resources"
}

/* variable "key" {
  description = "keys to be used to access EC2 instance"
}

variable "ami" {
  description = "ID of AMI to be used, default is Amazon Linux"
  default     = "ami-05ff5eaef6149df49"
} */