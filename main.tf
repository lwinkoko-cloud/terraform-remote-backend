resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_control" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_ownership_control]

  bucket = aws_s3_bucket.my_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_server_side_encription" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "my_dynamodb_table" {
  name         = var.dynamodb_name
  billing_mode = var.dynamodb_billing_mode
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}