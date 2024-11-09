resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  description   = "Lambda function for Serverless WebApp"
  architectures = ["x86_64"]
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.webapp_role.arn
  handler       = "index.test"

  #source_code_hash = data.archive_file.lambda.output_base64sha256
  #depends_on = [data.aws_iam_role.iam_role.lambda_logs, aws_cloudwatch_log_group.cloudwatch_logs]
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