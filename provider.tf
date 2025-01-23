provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      "Project" = "dotvideos"
    }
  }
}



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6" # which means any version equal & above
    }
  }
}
