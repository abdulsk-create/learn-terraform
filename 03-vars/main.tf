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

# Access a List Variable
output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_second" {
  value = var.fruits[1]
}

# Access a Map Variable
output "fruit_stock_apple" {
  value = var.fruit_stock["apple"]
}

output "fruit_stock_banana" {
  value = var.fruit_stock["banana"]
}