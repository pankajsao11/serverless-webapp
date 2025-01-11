/*
# API Gateway
resource "aws_api_gateway_rest_api" "api_gw" {
  name = "serverless-webApi"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "api_resource" {
  path_part   = "register"
  parent_id   = aws_api_gateway_rest_api.api_gw.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.api_gw.id
}

resource "aws_api_gateway_method" "api_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gw.id
  resource_id   = aws_api_gateway_resource.api_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.api_gw.id
  resource_id             = aws_api_gateway_resource.api_resource.id
  http_method             = aws_api_gateway_method.api_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.test_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "registration_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gw.id
  stage_name  = var.stage_name
  depends_on = [
    aws_api_gateway_integration.integration
  ]
}

output "api_url" {
  value = "${aws_api_gateway_rest_api.api_gw.execution_arn}/${var.stage_name}"
}
*/