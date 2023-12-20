terraform {
  backend "s3" {
    bucket = "nigel-db74"
    key = "09-state/terraform.tfstate"
    region = "us-east-1"
  }
}

variable "test" {
  default = "Hello Nigel"
}

output "test" {
  value = var.test
}