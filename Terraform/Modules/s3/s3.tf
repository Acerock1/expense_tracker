terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Specify the AWS provider version
    }
  }

#  backend "s3" {
 #   bucket         = "your-s3-bucket-name"       
  #  key            = "path/to/terraform.tfstate"  
   # region         = "us-east-1"                 
    #dynamodb_table = "your-dynamodb-table-name"   
    #encrypt        = true                        
  #}
}

provider "aws" {
  region = "us-east-1"  
}


resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  # Enable versioning
  versioning {
    enabled = var.enable_versioning
  }

  # Enable server-side encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
  ignore_public_acls  = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}