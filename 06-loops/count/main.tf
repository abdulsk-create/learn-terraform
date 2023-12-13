variable "components" {
  default =  ["catalogue", "frontend", "mongodb" ]
}

resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = element(var.components, count.index)
  }
}