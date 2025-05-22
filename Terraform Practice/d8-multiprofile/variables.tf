variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "The AWS CLI profile to use for authentication."
  type        = string
  default     = "Nikhil"
}