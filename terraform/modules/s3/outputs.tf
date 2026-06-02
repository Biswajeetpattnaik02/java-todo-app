output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "bucket_domain" {
  value = aws_s3_bucket.this.bucket_domain_name
}
