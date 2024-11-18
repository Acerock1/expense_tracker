
### Step 3: Using the Module

To use this module in a Terraform configuration, you would call it like this:

```hcl
module "s3_bucket" {
  source = "./s3-module" # Update with path to the module
  bucket_name = "my-unique-bucket-name"
  enable_versioning = true
  sse_algorithm = "AES256"
  tags = {
    Environment = "dev"
    Project     = "example"
  }
}




```hcl
module "dynamodb_table" {
  source = "./dynamodb-module" # Update with path to module

  table_name = "my-table"
  hash_key   = "id"
  hash_key_type = "S"
  billing_mode = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  enable_encryption = true
  tags = {
    Environment = "dev"
    Project     = "example"
  }
}
