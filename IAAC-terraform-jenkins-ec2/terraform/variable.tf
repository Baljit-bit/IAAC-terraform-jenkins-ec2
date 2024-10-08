variable "instance_type" {
  description = "EC2 Instances Type based on your Server Requirement"
  type        = string
  default     = "t3.micro"
}

variable "region" {
  description = "EC2 AWS region"
  type        = string
  default     = "ca-central-1"
}

variable "subnet_id" {
  description = "Enter your VPC Subnet1 ID"
  type        = string
  default     = "subnet-0c5ec87a473a3438d"
}

variable "amiID" {
  description = "EC2 AMI ID"
  type        = string
  default     = "ami-0b40e4b6457b17948"
}

variable "key_name" {
  description = "EC2 Instances jenkins key"
  type        = string
  default     = "jenkins"
}