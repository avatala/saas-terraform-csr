variable "attributes" {
  type = map(string)
default = {
env = "saas"
    }
}
variable "app_name" {
  type = string
}
variable "callback_url" {
  type = string
}
variable "email" {
  type = string
}
