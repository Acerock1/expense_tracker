# DynamoDB Table Module

This Terraform module creates an Amazon DynamoDB table with the following configurable attributes, billing mode, capacity settings, encryption, and global secondary indexes.

## Usage

```hcl
module "dynamodb_table" {
  source = "insert path to module" 

  table_name       = "my-table"
  hash_key         = "id"
  hash_key_type    = "S"
  billing_mode     = "PROVISIONED"
  read_capacity    = 5
  write_capacity   = 5
  enable_encryption = true
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
  global_secondary_indexes = [
    {
      name            = "GSI1"
      hash_key        = "gsi_hash"
      range_key       = "gsi_range"
      projection_type = "ALL"
      read_capacity   = 5
      write_capacity  = 5
    }
  ]
}
