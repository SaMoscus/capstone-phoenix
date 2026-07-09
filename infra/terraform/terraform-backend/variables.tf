variable "aws_region" {
  description = "AWS region for the cluster."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project use for backend resources."
  type        = string
  default     = "taskapp-phoenix-project"
}

variable "environment" {
  description = "Environment name for the backend resources."
  type        = string
  default     = "dev"
}