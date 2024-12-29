variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "accountId" {
  description = "Account Id/number"
  type        = string
  default     = "211125590785"
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

variable "mime_types" {
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
  }
}

variable "key" {
  default = "lambda_code.zip"
}
variable "table_name" {
  default = "webapp-DbTable"
}

variable "stage_name" {
  default = "dev"
}

/*variable "api_arn" {
  default = "arn:aws:apigateway:ap-south-1::/restapis/v9ym3uhba4"
}*/