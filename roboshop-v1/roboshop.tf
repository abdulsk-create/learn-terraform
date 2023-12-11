resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "frontend-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}