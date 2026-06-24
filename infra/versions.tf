terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend distant recommandé en production (S3 + DynamoDB lock).
  # Commenté pour permettre `terraform init -backend=false` en CI sans secrets.
  # backend "s3" {
  #   bucket         = "mon-org-tfstate"
  #   key            = "terraform-devsecops/terraform.tfstate"
  #   region         = "eu-west-3"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }
}
