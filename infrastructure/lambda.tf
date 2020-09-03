terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

data "archive_file" "lambda_zip" {
    type        = "zip"
    source_dir  = "../src"
    output_path = "../src/hello-world.zip"
}

resource "aws_lambda_function" "hello_world_lambda" {
  function_name = "Hello-World"
  filename = "../src/hello-world.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  handler = "hello-world-lambda.main_handler"
  runtime = "python3.8"
  role = aws_iam_role.lambda_exec.arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "hello-world-lambda"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.hello_world_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.hello-world-api-gateway.execution_arn}/*/*"
}

