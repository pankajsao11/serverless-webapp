variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "accountId" {
  description = "Account Id/number"
  type = string
  default = "211125590785"
}
variable "environment" {
  description = "Project Environment"
  type        = string
  default     = "development"
}

variable "lambda_function_name" {
  type    = string
  default = "webapp-function"
}