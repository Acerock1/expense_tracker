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

  # Enable public access blocking
  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
  ignore_public_acls  = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  tags = var.tags
}
