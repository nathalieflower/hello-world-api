
# create a zip file of the src directory for uploading to lambda
data "archive_file" "lambda_zip" {
    type        = "zip"
    source_dir  = "../src"
    output_path = "../src/hello-world.zip"
}

# create the lambda
# the lambda is re-uploaded if the hash of the existing code does not match.
resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  filename = "../src/hello-world.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  handler = "hello-world-lambda.main_handler"
  runtime = "python3.8"
  role = aws_iam_role.lambda_execution.arn
}


