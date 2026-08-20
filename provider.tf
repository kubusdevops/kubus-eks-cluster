terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "kubus-terraform-state"
    region = "us-east-1"
    key    = "kubus-eks/terraform.tfstate"
  }
  
}



provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      BillingID = "kubus-Team"
      Project   = "Non-Prod-Cluster"
      terraform = true
    }
  }
}


