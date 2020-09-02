resource "aws_api_gateway_rest_api" "hello-world-api-gateway" {
  name        = "Hello-World-Api-Gateway"
}

resource "aws_api_gateway_deployment" "example" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_integration.lambda_root,
  ]

  rest_api_id = aws_api_gateway_rest_api.hello-world-api-gateway.id
  stage_name  = "test"
}

output "base_url" {
  value = aws_api_gateway_deployment.example.invoke_url
}