terraform {
  backend "s3" {
    bucket = "terraform-state-0910"
    key    = "terraform/demo4"
    region = "us-east-2"
  }
}
