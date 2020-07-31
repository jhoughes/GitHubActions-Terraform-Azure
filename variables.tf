variable "prefix" {
  description = "This prefix will be included in the name of most resources"
  type        = string
}

variable "environment" {
  description = "This value is used to avoid naming conflicts"
  type        = string
}
