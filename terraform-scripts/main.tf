terraform {
  backend "s3" {
    bucket         = "my-terraform-webapps-bucket"
    key            = "terraform.tfstate"
    encrypt        = true
  }
}
