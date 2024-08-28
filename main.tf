terraform {
  # Optional: If you want to use Amazon S3 to store your TF state.
  #backend "s3" {
  #  bucket = "my-bucket"
  #  key    = "vpc-state"
  #  region = "ap-southeast-1"
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.62.0"
    }
  }

  required_version = ">= 1.9.5"
}

provider "aws" {
  region = "ap-southeast-1"
}
