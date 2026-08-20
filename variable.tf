variable "vpc_id" {
  type = string
  default = "vpc-0f8ffa69427e755ff"
  
}

variable "subnet_ranges" {
  type = list(string)
  default = ["subnet-04eff04788c28873e", "subnet-08a5324bee0d68c14", "subnet-09e89ecbfee521bc8"]
}

variable "availability_zones" {
  description = "The availability zones for the subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
