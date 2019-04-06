# Terraform network

Create the whole network architecture (VPC, Subnet, Route table, Internet Gateway, etc).

Note: your AWS credentials will automatically be retrieved by Terraform as long as there are located in `~/.aws/credentials` (under `[default]` section).

Don't forget to setup your sensitive information inside a `variables.tf`
e.g.
```terraform
variable "aws-region" {
  default     = "..."
  description = "AWS region"
}

variable "aws-availability-zone-1" {
  default = "..."
  description = "first AWS availability zone"
}

variable "aws-availability-zone-2" {
  default = "..."
  description = "second AWS availability zone"
}

variable "vpc-cidr" {
  default     = "..."
  description = "CIDR for the VPC"
}

variable "public-subnet-cidr" {
  default     = "..."
  description = "CIDR for the public subnet"
}

variable "private-subnet-cidr" {
  default     = "..."
  description = "CIDR for the private subnet"
}

variable "public-rt-cidr" {
  default     = "..."
  description = "CIDR for the public route table"
}
```

Base on this [article](https://hackernoon.com/manage-aws-vpc-as-infrastructure-as-code-with-terraform-55f2bdb3de2a) by [Mohamed Labouardy](https://hackernoon.com/@mlabouardy).