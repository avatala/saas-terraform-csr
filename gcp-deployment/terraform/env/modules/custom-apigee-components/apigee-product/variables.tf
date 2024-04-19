variable "name" {
type = string
}
variable "display_name" {
type = string
default = "SAAS Apigee Product"
}
variable "auto_approval_type" {
type = bool
default = true
}
variable "description" {
type = string
default = "SAAS environment ApigeeX Product"
}
variable "environments" {
type = list(string)
}
variable "scopes" {
type = list(string)
default = [""]
}
variable "attributes" {
type = map(string)
default = {
env = "saas"
    }
}
# variable "quota" {}
# variable "quota_interval" {}
# variable "quota_time_unit" {}

variable "operation" {
type = list(object({
api_proxy = string
path = string
method = list(string)
# quota = number
# quota_interval = number
# quota_time_unit = string
# attributes = map(string)
}))
default = [
{
api_proxy = "api-test"
path = "/v1"
method = ["GET"]
#  quota           = 5000
#  quota_interval  = 1
#  quota_time_unit = "month"
#  attributes = {
#       message-weight = "1"
#     }
}
]
}