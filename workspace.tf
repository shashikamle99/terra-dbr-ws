data "databricks_mws_credentials" "this" {}

data "databricks_mws_storage_configurations" "this" {}



# output "databricks_account_id" {
#   value = data.aws_ssm_parameter.dbr_account_id.value
#   sensitive = true
# }

locals {
    credentials_id  = data.databricks_mws_credentials.this.id
    storage_configuration_id  = data.databricks_mws_storage_configurations.this.id
}



resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = var.workspace_name
  credentials_id           = local.credentials_id 
  storage_configuration_id = local.storage_configuration_id
  # network_id               = databricks_mws_networks.this.network_id

  # token {
  #   comment = "Terraform"
  # }
}