variable "email" {
  type = string
}
variable "first_name" {
  type = string
}
variable "last_name" {
  type = string
}
variable "username" {
  type = string
}
variable "attributes" {
  type = map(string)
default = {
env = "saas"
    }
}
