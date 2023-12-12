data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-*"
  owners           = ["973714476881"]
}