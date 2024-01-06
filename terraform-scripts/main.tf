terraform {
  backend "s3" {
    bucket         = "var.aws_tfbucket"
    key            = "terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
  }
}
