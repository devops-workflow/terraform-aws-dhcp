
// Standard Variables

variable "name" {
  description = "Name"
}
variable "environment" {
  description = "Environment (ex: dev, qa, stage, prod)"
}
variable "namespaced" {
  description = "Namespace all resources (prefixed with the environment)?"
  default     = true
}
variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

// Module specific Variables

variable "domain_name" {
  description = "Domain name to be assigned by DHCP"
}
variable "domain_controllers" {
  description = "Domain name servers"
  type        = "list"
  default = ["AmazonProvidedDNS"]
}
variable "vpc_id" {
  description = "AWS VPC ID"
}
