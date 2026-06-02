resource "aws_s3_bucket" "this" {
  bucket = var.s3_bucket_name != "" ? var.s3_bucket_name : null
  acl    = "private"

  tags = {
    Name = var.s3_bucket_name != "" ? var.s3_bucket_name : "${var.vpc_name}-bucket"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.s3_versioning ? "Enabled" : "Suspended"
  }
  depends_on = [aws_s3_bucket.this]
}
