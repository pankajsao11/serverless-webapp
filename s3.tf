resource "aws_s3_bucket" "web_bucket" {
  bucket        = "serverless-fr0ntend-bucket"
  force_destroy = false
  website {
    index_document = "index.html"
  }

  tags = {
    Name        = "Frontend bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_owner" {
  bucket = aws_s3_bucket.web_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_access" {
  bucket = aws_s3_bucket.web_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_owner,
    aws_s3_bucket_public_access_block.bucket_access,
  ]

  bucket = aws_s3_bucket.web_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "web_app_bucket_policy" {
  bucket = aws_s3_bucket.web_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.web_bucket.arn}/*"
      }
    ]
  })
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}

# Upload a file to the S3 bucket
resource "aws_s3_object" "lambda_file" {
  bucket = aws_s3_bucket.web_bucket.id                                          # Reference the bucket
  key    = var.key                                                              # Destination key (S3 path)
  source = "D:/programming/Programs/serverless-webapp/lambda_code.zip"          # Path to the local file
  etag   = filemd5("D:/programming/Programs/serverless-webapp/lambda_code.zip") # Ensure upload happens if the file changes
}

output "bucket_name" {
  value = aws_s3_bucket.web_bucket.bucket
}