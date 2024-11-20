variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "two-tier-vpc"
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "allowed_cidrs" {
  description = "List of allowed CIDR blocks for application access"
  default     = ["0.0.0.0/0"]
}

variable "instance_count" {
  description = "Number of application instances"
  default     = 2
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  default     = "ami-00caa7df15d2e771f" # "ami-00706d218fa27caea"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}