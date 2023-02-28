terraform {
  backend "s3" {
    bucket         = "sprints-bootcamp-state-mbucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sprints"
  }
}