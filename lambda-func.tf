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
  handler       = "index.test"

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
resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "apigateway.amazonaws.com"
}
*/