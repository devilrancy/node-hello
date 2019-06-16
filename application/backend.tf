terraform {
  backend "s3" {
    bucket         = "node-hello-401518232566-ap-south-1"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "node-hello-401518232566-ap-south-1"
  }
}
