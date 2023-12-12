# Plain Variable
variable "fruit_name" {
  default = "apple"
}

output "fruit_name" {
  value = var.fruit_name
}

# List Variable
variable "fruits" {
  default = [ "apple", "banana" ]
}

# Map Variable
variable "fruit_stock" {
  default = {
    apple  = 100
    banana = 200
  }
}

# Map of Map Variable
variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 3
    }
    banana = {
      stock = 200
      price = 2
    }
  }
}