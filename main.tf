terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.30.0"
    }
  }

  required_version = ">= 1.2.7"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}
