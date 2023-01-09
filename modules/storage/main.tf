resource "aws_s3_bucket" "s3_bucket" {
}

resource "aws_s3_object" "images" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = "Images"
}

resource "aws_s3_object" "logs" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = "Logs"
}


resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle_configuration" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    id = "images"

    filter {
      prefix = "Images/"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    status = "Enabled"
  }

  rule {
    id = "logs"

    filter {
      prefix = "Logs/"
    }

    expiration {
      days = 90
    }

    status = "Enabled"
  }
}