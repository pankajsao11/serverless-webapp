resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  description   = "Lambda function for Serverless WebApp"
  architectures = ["x86_64"]
  #filename      = "lambda_function_payload.zip"

  s3_bucket = aws_s3_bucket.web_bucket.id
  s3_key    = var.key
  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }

  function_name = var.lambda_function_name
  role          = aws_iam_role.webapp_role.arn
  handler       = "lambda.lambda_handler"

  logging_config {
    log_format = "JSON"
  }
  runtime = "python3.12"
}

resource "aws_cloudwatch_log_group" "cloudwatch_logs" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  log_group_class   = "STANDARD"
  retention_in_days = 14
}

/*
# Lambda
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
}
*/