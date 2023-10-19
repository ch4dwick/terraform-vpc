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
      version = "~> 5.21.0"
    }
  }

  required_version = ">= 1.6.2"
}

provider "aws" {
  region = "ap-southeast-1"
}
