data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["dynamodb:*", "cloudwatch:*", "lambda:*", "s3:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "webapp_role" {
  name = "serverless-webapp-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Role_usage = "Permission for DynamoDB and Cloudwatch"
  }
}

resource "aws_iam_policy" "policy" {
  name        = "permissions_attachment"
  description = "Policy for Lambda to access DynamoDB, CloudWatch, and S3"
  policy      = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "permission-attach" {
  role       = aws_iam_role.webapp_role.name
  policy_arn = aws_iam_policy.policy.arn
}

output "lambda_role_arn" {
  value = aws_iam_role.webapp_role.arn
}