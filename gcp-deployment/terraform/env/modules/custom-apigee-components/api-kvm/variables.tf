variable "env_name" {
  type = string
}
variable "name" {
  type = string
}
variable "entry" {
 type = map(string)
 default = {}
}
