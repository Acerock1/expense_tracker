module "s3_bucket" {
  source = "../Modules/s3"

  bucket_name         = "backend-for-project-1122"
  enable_versioning   = true
  sse_algorithm       = "AES256"
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}

module "dynamodb_table" {
  source = "../Modules/Dynamodb"

  table_name       = "Terraform-lock-project"
  hash_key         = "Lockid"
  hash_key_type    = "S"
  billing_mode     = "PROVISIONED"
  enable_encryption = true
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}