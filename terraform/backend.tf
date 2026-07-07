terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "dancing-goat-tfstate-533266976950"
    key            = "dancing-goat/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dancing-goat-tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
