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

# Variable Data Types
variable "fruit_details" {
  default = {
    apple = {
      stock = 100
      type = "abdul"
      for_sale = true
    }
    banana = {
      stock = 200
      type = "washington"
      for_sale = true
    }
  }
}

# Variable in a combination of any other string then it needs to be with in ${}
output "fruit_name_1" {
  value = "Fruit Name = ${var.fruit_name}"
}

output "fruit_details_apple" {
  value = "Apple Stock = ${var.fruit_details["apple"].stock} , Apple Type = ${var.fruit_details["apple"].type}, Apple Sale Status = ${var.fruit_details["apple"].for_sale}"
}