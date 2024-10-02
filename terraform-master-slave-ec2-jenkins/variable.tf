variable "instance_type" {
  description = "EC2 Instances Type based on your Server Requirement"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "EC2 AWS region"
  type        = string
  default     = "ca-central-1"
}

variable "master_amiID" {
  description = "Master EC2 AMI ID"
  type        = string
  default     = "ami-046d18c147c36bef1"
}

variable "slave_amiID" {
  description = "Slave EC2 AMI ID"
  type        = string
  default     = "ami-046d18c147c36bef1"
}

variable "ec2sgid" {
  description = "EC2 Security Group ID"
  type        = string
  default     = "sg-0f3ad0655920520e5"
}