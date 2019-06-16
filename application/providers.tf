data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

variable "aws_region" {
  default = "ap-south-1"
}

provider "aws" {
  region = "${var.aws_region}"
}
