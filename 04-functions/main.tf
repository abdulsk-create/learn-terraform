variable "fruits" {
  default = ["apple", "banana", 2]
}
output "fruits" {
  value = element(var.fruits, 2)
}