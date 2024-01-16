# data "databricks_mws_credentials" "this" {}

# data "databricks_mws_storage_configurations" "this" {}

# output "databricks_account_id" {
#   value = data.aws_ssm_parameter.dbr_account_id.value
#   sensitive = true
# }


# data "aws_cloudformation_export" "this" {
#   name = "CredentialsId"
# }

# data "aws_cloudformation_export" "this1" {
#   name = "StorageConfigId"
# }



# locals {
#     credentials_id  = data.aws_cloudformation_export.this.value
#     storage_configuration_id  = data.aws_cloudformation_export.this1.value
# }



resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = var.credentials_id 
  storage_configuration_id = var.storage_configuration_id
  # network_id               = databricks_mws_networks.this.network_id

  # token {
  #   comment = "Terraform"
  # }
}