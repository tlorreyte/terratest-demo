resource "aws_s3_bucket" "static" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_acl" "static" {
  bucket = aws_s3_bucket.static.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "static" {
  bucket = aws_s3_bucket.static.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_cors_configuration" "static" {
  bucket = aws_s3_bucket.static.bucket

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_versioning" "static" {
  bucket = aws_s3_bucket.static.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "static" {
  bucket        = aws_s3_bucket.static.id
  target_bucket = aws_s3_bucket.log_static.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_policy" "static" {
  bucket = aws_s3_bucket.static.id
  policy = templatefile("${path.module}/templates/bucket_policy.tftpl", { bucket_arn = aws_s3_bucket.static.arn })
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.static.bucket
  key          = "index.html"
  source       = "${path.module}/templates/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.static.bucket
  key          = "error.html"
  source       = "${path.module}/templates/error.html"
  content_type = "text/html"
}

// ------------- //

resource "aws_s3_bucket" "log_static" {
  bucket = "${var.bucket_name}-logs"
  tags   = var.tags
}

resource "aws_s3_bucket_acl" "log_static" {
  bucket = aws_s3_bucket.static.id
  acl    = "private"
}

// ------------- //

resource "aws_dynamodb_table" "ddb" {
  name           = "test-ddb-tlorreyte"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2000
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"
  point_in_time_recovery {
    enabled = true
  }

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}