variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_name" {
    default = "example-vpc"
}

variable "aws_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "aws_private_subnets" {
  type = list(string)
  nullable = false
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "aws_public_subnets" {
  type = list(string)
  nullable = false
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "eks_cluster_name" {
  default = "eks-cluster-example"
}

variable "instance_types" {
  type = list(string)
  nullable = false
  default = ["m5.xlarge"]
}