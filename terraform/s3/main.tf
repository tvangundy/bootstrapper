provider "aws" {
  region = "us-east-2" // Specify your desired region
}

resource "aws_s3_bucket" "bootstrapper" {
  bucket = "bootstrapper-test-bucket" 

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "Bootstrapper S3 Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_public_access_block" "bootstrapper" {
  bucket = aws_s3_bucket.bootstrapper.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

output "bootstrapper_bucket_name" {
  value = aws_s3_bucket.bootstrapper.id
}
