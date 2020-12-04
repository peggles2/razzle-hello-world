locals {
  region     = "us-east-1"
  account_id = "248615503339"
}

provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = [local.account_id]
}

terraform {
  backend "s3" {
    bucket         = "sbagovlower-terraform-remote-state"
    key            = "coral-lower.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locktable"
    acl            = "bucket-owner-full-control"
  }
}
