terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Specify the AWS provider version
    }
  }

#  backend "s3" {
 #   bucket         = "your-s3-bucket-name"       
  #  key            = "path/to/terraform.tfstate"  
   # region         = "us-east-1"                 
    #dynamodb_table = "your-dynamodb-table-name"   
    #encrypt        = true                        
  #}
}

provider "aws" {
  region = "us-east-1"  
}
