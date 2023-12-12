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


resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

# MONGODB
resource "aws_instance" "mongodb" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "mongodb-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

# CATALOGUE
resource "aws_instance" "catalogue" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "catalogue-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

# REDIS
resource "aws_instance" "redis" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "redis-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

# USER
resource "aws_instance" "user" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "redis-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

# CART
resource "aws_instance" "cart" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "cart-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

# MYSQL
resource "aws_instance" "mysql" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "mysql-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

# SHIPPING
resource "aws_instance" "shipping" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "shipping-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

# RABBITMQ
resource "aws_instance" "rabbitmq" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "rabbitmq-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

# PAYMENT
resource "aws_instance" "payment" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-033bdcf77df8a24c1" ]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z073136637APEOW2NQTH0"
  name    = "payment-dev.entertanova.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}



