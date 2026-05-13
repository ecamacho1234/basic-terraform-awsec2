terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-west-2"
    bucket         = "portfolio75h5t5-prod-terraformsa-state"
    key            = "terraform.tfstate"
    dynamodb_table = "portfolio75h5t5-prod-terraformsa-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
