provider "aws" {
  region                  = var.region
  shared_credentials_file = var.credentials_file
  profile                 = var.profile
}

terraform {
  
  required_version = ">= 0.14.5"

  required_providers {
  
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }

  }
  
#   backend "s3" {
#     bucket = "s3-bucket-cucumbernetes-tf-state"
#     key    = "state/"
#     region = "eu-west-1"
#   }
}
