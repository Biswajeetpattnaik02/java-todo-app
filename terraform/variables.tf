variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name tag for the VPC and related resources"
  type        = string
  default     = "todo-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Optional key name to create or use for EC2 SSH access"
  type        = string
  default     = ""
}

variable "public_key_path" {
  description = "Path to local public key file to upload as an AWS key pair (optional)"
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "Name for the S3 bucket to create (must be globally unique)"
  type        = string
  default     = ""
}

variable "s3_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = false
}


