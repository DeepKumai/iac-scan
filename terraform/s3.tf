resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "my-tf-test-bucket"
  acl           = "public"
  force_destroy = true
  tags = {
    Environment = "Dev"
    }
}

resource "aws_s3_bucket" "logs" {
  bucket = "my-tf-test-bucket-logs"
  acl    = "log-delivery-write"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  force_destroy = true
  tags = {
    Environment = "Dev"
    }
}