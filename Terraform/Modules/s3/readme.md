# S3 Bucket Module

This Terraform module creates an Amazon S3 bucket with the following configurable options for versioning, encryption, and public access blocks.

## Usage

```hcl
module "s3_bucket" {
  source = "insert path to module" 

  bucket_name         = "my-unique-bucket-name"
  enable_versioning   = true
  sse_algorithm       = "AES256"
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}
