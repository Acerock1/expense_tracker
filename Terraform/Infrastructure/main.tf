module "Expense-Tracker-Bucket" {
  source = "../Modules/s3"

  bucket_name       = "expense-tracker-bucket-1212"
  enable_versioning = true
  sse_algorithm     = "AES256"
  tags = {
    Environment = "dev"
    Project     = "example"
  }
}

module "Expense-Tracker-Table" {
  source = "../Modules/Dynamodb"

  table_name       = "Expense-Tracker-Table"
  hash_key         = "uuid_hash"
  hash_key_type    = "S"
  billing_mode     = "PROVISIONED"
  enable_encryption = true
  tags = {
    Environment = "dev"
    Project     = "example"
  }
}



