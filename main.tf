terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11.0"
    }
  }

  required_version = ">= 1.1.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}
