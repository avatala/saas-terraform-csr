variable "lookup_resource" {
 type        = string
 description = "the resource id, if changed then random module will recreate string, else not"
 default     = ""
}

variable "string_length" {
  type        = number
  description = "The length of the random string"
  default     = 6
}

variable "special" {
  type        = bool
  description = "Include special characters in the result"
  default     = false
}

variable "upper" {
  type        = bool
  description = "Include uppercase alphabet characters in the result"
  default     = false
}

variable "numeric" {
 type        = bool
 description = "Include numeric characters in the result"
 default     = false
}