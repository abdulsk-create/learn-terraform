variable "fruits" {
  default = ["apple", "banana"]
}
output "fruit" {
  value = element(var.fruits, 2)
}

variable "fruit_with_stock" {
  default = {
    apple = 100
  }
}

output "fruit_stock" {
  value = try(var.fruit_with_stock["banana"], 0)
}

output "fruit_stock_price" {
  value = lookup(var.fruit_with_stock["apple"], "price", 2)
}