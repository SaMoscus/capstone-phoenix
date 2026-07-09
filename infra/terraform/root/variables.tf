variable "project_name" {
  description = "Name prefix used for AWS resources."
  type        = string
  default     = "taskapp"
}

variable "aws_region" {
  description = "AWS region for the cluster."
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "Availability zones for public subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_cidr" {
  description = "CIDR block for the cluster VPC."
  type        = string
  default     = "10.42.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs. Provide at least three for node spread."
  type        = list(string)
  default     = ["10.42.1.0/24", "10.42.2.0/24", "10.42.3.0/24"]
}

variable "admin_cidr" {
  description = "Your public IP as a /32 for SSH and Kubernetes API access."
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI ID for the selected region."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for all nodes."
  type        = string
  default     = "c7i-flex.large"
}

variable "key_name" {
  description = "Existing EC2 key pair name."
  type        = string
}

variable "worker_count" {
  description = "Number of k3s worker nodes."
  type        = number
  default     = 2

  validation {
    condition     = var.worker_count >= 2
    error_message = "worker_count must be at least 2 for the capstone."
  }
}

variable "associate_public_address" {
  description = "Attach public IPs for SSH. Keep true unless you add a bastion/VPN."
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment name for the backend resources."
  type        = string
  default     = "dev"
}