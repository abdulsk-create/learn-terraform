variable "security_groups" {
  default = [ "sg-033bdcf77df8a24c1" ]
}

variable "zone_id" {
  default = "Z073136637APEOW2NQTH0"
}

variable "components" {
  default = {
    frontend = {
      name = " frontend"
      instance_type = "t3.micro"
    }
    mongodb = {
      name = " mongodb"
      instance_type = "t3.micro"
    }
  }
}