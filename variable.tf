variable "client_id" {}
variable "client_secret" {}
variable "databricks_account_id" {}

variable "workspace_name" {}

variable "credentials_id" {}

variable "storage_configuration_id" {}

# variable "tags" {
#   default = {}
# }

# variable "cidr_block" {
#   default = "10.4.0.0/16"
# }

variable "region" {
  default = "us-west-1"
}

# resource "random_string" "naming" {
#   special = false
#   upper   = false
#   length  = 6
# }

# locals {
#   prefix = "demo${random_string.naming.result}"
# }