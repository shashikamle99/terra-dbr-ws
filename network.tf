
data "aws_vpc" "this" {
   tags = {
    Name = "databricks-WorkerEnvId(workerenv-811664583122875-168c7d50-fd8c-4bd9-a2ea-d88cd9772963)"
  }
}

# data "aws_subnets" "this" {
#   filter {
#     name   = data.aws_vpc.this.id
#     values = [var.vpc_id]
#   }
# }


resource "aws_subnet" "dbr_subnet" {
   vpc_id = data.aws_vpc.this.id
   cidr_block = "10.43.224.0/19"
}


resource "aws_security_group" "sg" {
    vpc_id = data.aws_vpc.this.id
}


resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = local.databricks_account_id
  network_name       = "dev-network"
  security_group_ids = [aws_security_group.sg.id]
  subnet_ids         = [aws_subnet.dbr_subnet.id]
  vpc_id             = data.aws_vpc.this.id
}