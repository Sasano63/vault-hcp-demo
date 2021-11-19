variable "client-id" {
    description = "service-principal-key-client-id"
}
variable "client-secret" {
    description = "service-principal-key-client-secret"
}

variable "region" {
    default = "eu-central-1"
}

variable "cidr_block" {
    default = "172.26.16.0/20"
}

