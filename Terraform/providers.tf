terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Specify the AWS provider version
    }
  }

  backend "s3" {
    bucket         = "backend-for-project-1122"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "Terraform-lock-project"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}