resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "frontend"
  }
}

#resource "aws_route53_record" "frontend" {
#  zone_id = aws_route53_zone.primary.zone_id
#  name    = "www.example.com"
#  type    = "A"
#  ttl     = 300
#  records = [aws_eip.lb.public_ip]
#}