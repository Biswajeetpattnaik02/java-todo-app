output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "s3_bucket_domain" {
  value = module.s3.bucket_domain
}


