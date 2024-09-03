terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.47.0"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = ">= 1.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.4.0"
    }
  }
}