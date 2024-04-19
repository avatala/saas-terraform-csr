variable "name" {
type = string
}
variable "env_name" {
 type = string 
}
variable "target_host" {
  type = string
}
variable "port" {
 type = number
 default = 443
}
variable "enable_server" {
 type = bool
 default = true
}
variable "ssl_enabled" {
  type = bool
  default = false
}