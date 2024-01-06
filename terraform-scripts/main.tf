terraform {
  backend "s3" {
    bucket         = "my-terraform-webapps-bucket1"
    key            = "terraform.tfstate"
    encrypt        = true
  }
}
