terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.region
  #profile = pankajsahu

  default_tags {
    tags = {
      "Method"              = "Infrastructure as Code"
      "Automation"          = "Terraform"
      "Project-Environment" = var.environment
    }
  }
}