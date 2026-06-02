variable "vpc_id" {
  type = string
}

variable "public_subnets_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "public_route_table_id" {
  type = string
}

variable "vpc_name" {
  type = string
}
