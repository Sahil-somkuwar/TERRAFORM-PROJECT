provider "aws" {
    region = "eu-north-1"
}

resource "aws_s3_bucket" "bucket1" {
    bucket = "my-bucket-adityakadu" 

tags = {
    Name = "my-bucket"
    Environment = "dev"

}
}

## Block Public Access ---> this option present in s3 
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

## for acl we have to write multiple things
## Versioning
resource "aws_s3_bucket_versioning" "my_version" {
  bucket = aws_s3_bucket.bucket1.id 

  versioning_configuration {
    status = "Enabled"
  }
}