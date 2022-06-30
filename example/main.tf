terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "test" {
    source = "./.."

    bucket_name = "test-tlorreyte-cloud-ouest"
}

output "bucket_endpoint" {
  value = module.test.bucket_endpoint
}