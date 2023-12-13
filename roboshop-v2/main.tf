variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "instance_type" {
  default = "t3.small"
}

variable "security_groups" {
  default = [ "sg-033bdcf77df8a24c1" ]
}

variable "zone_id" {
  default = "Z073136637APEOW2NQTH0"
}

variable "components" {
  default = {
    frontend = {name = "frontend-dev"}
    mongodb = {name = "mongodb-dev"}
    catalogue = {name = "catalogue-dev"}
    redis = {name = "redis-dev"}
    user = {name = "user-dev"}
    cart = {name = "cart-dev"}
    mysql = {name = "mysql-dev"}
    rabbitmq = {name = "rabbitmq-dev"}
    shipping = {name = "shipping-dev"}
    payment = {name = "payment-dev"}
  }
}


resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.value, "name", null)
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${lookup(each.value, "name", null)}.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null)]
}

output "instances" {
  value = aws_instance.instance
}









## MONGODB
#resource "aws_instance" "mongodb" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "mongodb"
#  }
#}
#
#resource "aws_route53_record" "mongodb" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "mongodb-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mongodb.private_ip]
#}
#
## CATALOGUE
#resource "aws_instance" "catalogue" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "catalogue"
#  }
#}
#
#resource "aws_route53_record" "catalogue" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "catalogue-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.catalogue.private_ip]
#}
#
## REDIS
#resource "aws_instance" "redis" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "redis"
#  }
#}
#
#resource "aws_route53_record" "redis" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "redis-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.redis.private_ip]
#}
#
## USER
#resource "aws_instance" "user" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "user"
#  }
#}
#
#resource "aws_route53_record" "user" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "redis-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.user.private_ip]
#}
#
## CART
#resource "aws_instance" "cart" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "cart"
#  }
#}
#
#resource "aws_route53_record" "cart" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "cart-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.cart.private_ip]
#}
#
## MYSQL
#resource "aws_instance" "mysql" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "mysql"
#  }
#}
#
#resource "aws_route53_record" "mysql" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "mysql-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mysql.private_ip]
#}
#
## SHIPPING
#resource "aws_instance" "shipping" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "shipping"
#  }
#}
#
#resource "aws_route53_record" "shipping" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "shipping-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.shipping.private_ip]
#}
#
## RABBITMQ
#resource "aws_instance" "rabbitmq" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "rabbitmq"
#  }
#}
#
#resource "aws_route53_record" "rabbitmq" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "rabbitmq-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.rabbitmq.private_ip]
#}
#
## PAYMENT
#resource "aws_instance" "payment" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.small"
#  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]
#
#  tags = {
#    Name = "payment"
#  }
#}
#
#resource "aws_route53_record" "payment" {
#  zone_id = "Z073136637APEOW2NQTH0"
#  name    = "payment-dev.entertanova.com"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.payment.private_ip]
#}



